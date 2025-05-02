#define FORBIDDEN_SYMBOL_ALLOW_ALL
#include "common/scummsys.h"
#include <SDL2/SDL.h>
#include <SDL2/SDL_opengl.h>
#include <stdio.h>
#include <time.h>
#include "graphics/tinygl/tinygl.h"
#include "graphics/tinygl/zgl.h"

#define WINDOW_WIDTH 800
#define WINDOW_HEIGHT 600
#define ENABLE_DISPLAY 1

// Simple cube vertices
static const float cube_vertices[] = {
    // Front face
    -1.0f, -1.0f,  1.0f,
     1.0f, -1.0f,  1.0f,
     1.0f,  1.0f,  1.0f,
    -1.0f,  1.0f,  1.0f,
    // Back face
    -1.0f, -1.0f, -1.0f,
    -1.0f,  1.0f, -1.0f,
     1.0f,  1.0f, -1.0f,
     1.0f, -1.0f, -1.0f,
    // Top face
    -1.0f,  1.0f, -1.0f,
    -1.0f,  1.0f,  1.0f,
     1.0f,  1.0f,  1.0f,
     1.0f,  1.0f, -1.0f,
    // Bottom face
    -1.0f, -1.0f, -1.0f,
     1.0f, -1.0f, -1.0f,
     1.0f, -1.0f,  1.0f,
    -1.0f, -1.0f,  1.0f,
    // Right face
     1.0f, -1.0f, -1.0f,
     1.0f,  1.0f, -1.0f,
     1.0f,  1.0f,  1.0f,
     1.0f, -1.0f,  1.0f,
    // Left face
    -1.0f, -1.0f, -1.0f,
    -1.0f, -1.0f,  1.0f,
    -1.0f,  1.0f,  1.0f,
    -1.0f,  1.0f, -1.0f
};

// Cube texture coordinates
static const float cube_texcoords[] = {
    // Front face
    0.0f, 0.0f,
    1.0f, 0.0f,
    1.0f, 1.0f,
    0.0f, 1.0f,
    // Back face
    1.0f, 0.0f,
    1.0f, 1.0f,
    0.0f, 1.0f,
    0.0f, 0.0f,
    // Top face
    0.0f, 1.0f,
    0.0f, 0.0f,
    1.0f, 0.0f,
    1.0f, 1.0f,
    // Bottom face
    1.0f, 1.0f,
    0.0f, 1.0f,
    0.0f, 0.0f,
    1.0f, 0.0f,
    // Right face
    1.0f, 0.0f,
    1.0f, 1.0f,
    0.0f, 1.0f,
    0.0f, 0.0f,
    // Left face
    0.0f, 0.0f,
    1.0f, 0.0f,
    1.0f, 1.0f,
    0.0f, 1.0f
};

// Cube indices
static const unsigned int cube_indices[] = {
    0, 1, 2, 0, 2, 3,    // Front
    4, 5, 6, 4, 6, 7,    // Back
    8, 9, 10, 8, 10, 11, // Top
    12, 13, 14, 12, 14, 15, // Bottom
    16, 17, 18, 16, 18, 19, // Right
    20, 21, 22, 20, 22, 23  // Left
};

// Enumeration for render modes to test all ztriangle template combinations
enum RenderMode {
    MODE_FLAT,                // Flat shading, no texture
    MODE_GOURAUD,             // Gouraud shading, no texture
    MODE_TEXTURE,             // Textured
    MODE_TEXTURE_GOURAUD,     // Textured with lighting
    MODE_ALPHA_BLEND,         // Alpha blending
    MODE_DEPTH_TEST,          // Depth testing
    MODE_TEXTURE_PERSPECTIVE, // Texture with perspective correction
    MODE_FOG,                 // Fog
    MODE_COUNT
};

// Structure to store statistics for each render mode
struct ModeStats {
    float minFps = 1e9f; // Initialize min to a large value
    float maxFps = 0.0f;
    double totalFpsSum = 0.0; // Use double for sum to avoid precision issues
    int measurementCount = 0;
    float avgFps = 0.0f; // Store calculated average
};

// Global variables
RenderMode currentMode = MODE_FLAT;
const char* modeNames[] = {
    "Flat Shading",
    "Gouraud Shading",
    "Texture",
    "Texture + Lighting",
    "Alpha Blending",
    "Depth Test",
    "Texture + Perspective",
    "Fog"
};

// Store FPS results for each mode
ModeStats modeStats[MODE_COUNT];
bool modeCompleted[MODE_COUNT] = {false};

TGLuint textureID;

// Create a checkerboard texture
void createTexture() {
    tglGenTextures(1, &textureID);
    tglBindTexture(TGL_TEXTURE_2D, textureID);

    // Set texture parameters
    tglTexParameteri(TGL_TEXTURE_2D, TGL_TEXTURE_WRAP_S, TGL_REPEAT);
    tglTexParameteri(TGL_TEXTURE_2D, TGL_TEXTURE_WRAP_T, TGL_REPEAT);
    tglTexParameteri(TGL_TEXTURE_2D, TGL_TEXTURE_MAG_FILTER, TGL_NEAREST);
    tglTexParameteri(TGL_TEXTURE_2D, TGL_TEXTURE_MIN_FILTER, TGL_NEAREST);

    // Create checkerboard pattern
    const int size = 64;
    unsigned char texture[size * size * 4];
    for (int y = 0; y < size; y++) {
        for (int x = 0; x < size; x++) {
            unsigned char color = ((x & 8) == 0) ^ ((y & 8) == 0) ? 255 : 0;
            texture[(y * size + x) * 4 + 0] = color;          // R
            texture[(y * size + x) * 4 + 1] = color;          // G
            texture[(y * size + x) * 4 + 2] = 255 - color;    // B
            texture[(y * size + x) * 4 + 3] = 255;            // A
        }
    }

    tglTexImage2D(TGL_TEXTURE_2D, 0, TGL_RGBA, size, size, 0, TGL_RGBA, TGL_UNSIGNED_BYTE, texture);
}

void setupRenderMode(RenderMode mode) {
    // Reset states
    tglDisable(TGL_BLEND);
    tglDisable(TGL_ALPHA_TEST);
    tglDisable(TGL_FOG);
    tglDisable(TGL_TEXTURE_2D);
    tglDisable(TGL_LIGHTING);
    tglEnable(TGL_DEPTH_TEST);
    tglDepthFunc(TGL_LESS);
    tglDepthMask(TGL_TRUE);
    tglShadeModel(TGL_FLAT);

    // Configure based on mode
    switch (mode) {
    case MODE_FLAT:
        tglShadeModel(TGL_FLAT);
        break;

    case MODE_GOURAUD:
        tglShadeModel(TGL_SMOOTH);
        tglEnable(TGL_LIGHTING);
        tglEnable(TGL_LIGHT0);
        break;

    case MODE_TEXTURE:
        tglEnable(TGL_TEXTURE_2D);
        tglBindTexture(TGL_TEXTURE_2D, textureID);
        break;

    case MODE_TEXTURE_GOURAUD:
        tglEnable(TGL_TEXTURE_2D);
        tglBindTexture(TGL_TEXTURE_2D, textureID);
        tglShadeModel(TGL_SMOOTH);
        tglEnable(TGL_LIGHTING);
        tglEnable(TGL_LIGHT0);
        break;

    case MODE_ALPHA_BLEND:
        tglEnable(TGL_BLEND);
        tglBlendFunc(TGL_SRC_ALPHA, TGL_ONE_MINUS_SRC_ALPHA);
        tglEnable(TGL_TEXTURE_2D);
        tglBindTexture(TGL_TEXTURE_2D, textureID);
        break;

    case MODE_DEPTH_TEST:
        // Already enabled by default
        break;

    case MODE_TEXTURE_PERSPECTIVE:
        tglEnable(TGL_TEXTURE_2D);
        tglBindTexture(TGL_TEXTURE_2D, textureID);
        // TinyGL always uses perspective correction
        break;

    case MODE_FOG: {
        tglEnable(TGL_FOG);
        float fogColor[4] = {0.5f, 0.5f, 0.5f, 1.0f};
        tglFogfv(TGL_FOG_COLOR, fogColor);
        tglFogf(TGL_FOG_START, 2.0f);
        tglFogf(TGL_FOG_END, 10.0f);
        tglFogf(TGL_FOG_DENSITY, 0.5f);
        tglFogi(TGL_FOG_MODE, TGL_LINEAR);
        break;
    }

    case MODE_COUNT:
        break;
    }
}

void drawCube() {
    // Start drawing triangles
    tglBegin(TGL_TRIANGLES);

    for (int i = 0; i < 36; i++) {
        int vertexIndex = cube_indices[i];

        // Set color for each vertex (useful for flat & Gouraud shading)
        // Cycle through colors for the faces
        float r, g, b;
        switch (i / 6) {
            case 0: r = 1.0f; g = 0.0f; b = 0.0f; break; // Red
            case 1: r = 0.0f; g = 1.0f; b = 0.0f; break; // Green
            case 2: r = 0.0f; g = 0.0f; b = 1.0f; break; // Blue
            case 3: r = 1.0f; g = 1.0f; b = 0.0f; break; // Yellow
            case 4: r = 0.0f; g = 1.0f; b = 1.0f; break; // Cyan
            case 5: r = 1.0f; g = 0.0f; b = 1.0f; break; // Magenta
        }

        if (currentMode == MODE_ALPHA_BLEND) {
            tglColor4f(r, g, b, 0.7f); // Alpha for blending
        } else {
            tglColor3f(r, g, b);
        }

        // Set texture coordinates if using texture
        if (currentMode == MODE_TEXTURE ||
            currentMode == MODE_TEXTURE_GOURAUD ||
            currentMode == MODE_ALPHA_BLEND ||
            currentMode == MODE_TEXTURE_PERSPECTIVE) {
            tglTexCoord2fv(&cube_texcoords[vertexIndex * 2]);
        }

        // Set vertex
        tglVertex3fv(&cube_vertices[vertexIndex * 3]);
    }

    tglEnd();
}

// Print the final benchmark summary
void printBenchmarkSummary(int testDuration) {
    printf("\n=== TinyGL Benchmark Summary ===\n");
    printf("Resolution: %dx%d, Test Duration: %d seconds/mode\n\n", WINDOW_WIDTH, WINDOW_HEIGHT, testDuration);

    printf("Mode                  | Min FPS | Avg FPS | Max FPS\n");
    printf("----------------------|---------|---------|---------\n");

    float totalAvgFps = 0.0f;
    for (int i = 0; i < MODE_COUNT; i++) {
        // Handle case where min wasn't updated (no measurements)
        float displayMinFps = (modeStats[i].measurementCount > 0) ? modeStats[i].minFps : 0.0f;
        printf("%-21s | %7.1f | %7.1f | %7.1f\n",
               modeNames[i],
               displayMinFps,
               modeStats[i].avgFps,
               modeStats[i].maxFps);
        totalAvgFps += modeStats[i].avgFps;
    }

    printf("----------------------|---------|---------|---------\n");
    float overallAverage = (MODE_COUNT > 0) ? (totalAvgFps / MODE_COUNT) : 0.0f;
    printf("Overall Average       |         | %7.1f |\n", overallAverage);

    // Find min and max average FPS
    float minAvgFps = (MODE_COUNT > 0) ? modeStats[0].avgFps : 0.0f;
    float maxAvgFps = (MODE_COUNT > 0) ? modeStats[0].avgFps : 0.0f;
    int minMode = 0;
    int maxMode = 0;

    if (MODE_COUNT > 0 && modeStats[0].measurementCount == 0) {
        // Find the first mode that actually ran, if any
        for (int i = 1; i < MODE_COUNT; ++i) {
            if (modeStats[i].measurementCount > 0) {
                minAvgFps = modeStats[i].avgFps;
                maxAvgFps = modeStats[i].avgFps;
                minMode = i;
                maxMode = i;
                break;
            }
        }
    }


    for (int i = 1; i < MODE_COUNT; i++) {
        if (modeStats[i].measurementCount > 0) { // Only consider modes that ran
            if (modeStats[i].avgFps < minAvgFps) {
                minAvgFps = modeStats[i].avgFps;
                minMode = i;
            }
            if (modeStats[i].avgFps > maxAvgFps) {
                maxAvgFps = modeStats[i].avgFps;
                maxMode = i;
            }
        }
    }

    printf("\nFastest mode (Avg): %s (%.1f FPS)\n", modeNames[maxMode], maxAvgFps);
    printf("Slowest mode (Avg): %s (%.1f FPS)\n", modeNames[minMode], minAvgFps);

    if (minAvgFps > 0.0f) { // Avoid division by zero
        printf("\nPerformance ratio (fastest/slowest Avg): %.2fx\n", maxAvgFps / minAvgFps);
    } else {
        printf("\nPerformance ratio (fastest/slowest Avg): N/A (slowest avg is 0)\n");
    }
}

// Check if all modes have been tested
bool allModesCompleted() {
    for (int i = 0; i < MODE_COUNT; i++) {
        if (!modeCompleted[i]) {
            return false;
        }
    }
    return true;
}

int main(int argc, char* argv[]) {
#if ENABLE_DISPLAY
    if (SDL_Init(SDL_INIT_VIDEO) < 0) {
        printf("SDL could not initialize! SDL_Error: %s\n", SDL_GetError());
        return -1;
    }

    SDL_Window *window = SDL_CreateWindow("TinyGL Benchmark",
                             SDL_WINDOWPOS_UNDEFINED,
                             SDL_WINDOWPOS_UNDEFINED,
                             WINDOW_WIDTH,
                             WINDOW_HEIGHT,
                             SDL_WINDOW_SHOWN);

    if (window == NULL) {
        printf("Window could not be created! SDL_Error: %s\n", SDL_GetError());
        return -1;
    }

    SDL_Surface *screen = SDL_GetWindowSurface(window);
    printf("Window surface format: %s\n", SDL_GetPixelFormatName(screen->format->format));
#endif

    // Initialize TinyGL with the screen's pixel format
    Graphics::PixelFormat pixelFormat(4, 8, 8, 8, 8, 24, 16, 8, 0);
    printf("Initializing TinyGL with format: %d bits per pixel\n", pixelFormat.bytesPerPixel * 8);

    // Create context with stencil buffer support
    TinyGL::ContextHandle* context = TinyGL::createContext(WINDOW_WIDTH, WINDOW_HEIGHT, pixelFormat, 256, false, false);
    if (!context) {
        printf("Failed to create TinyGL context!\n");
        return -1;
    }
    TinyGL::setContext(context);

    // Create texture for textured modes
    createTexture();

    // Set up the view
    tglMatrixMode(TGL_PROJECTION);
    tglLoadIdentity();
    tglFrustum(-1.0, 1.0, -1.0, 1.0, 1.0, 100.0);

    tglMatrixMode(TGL_MODELVIEW);
    tglLoadIdentity();
    tglTranslatef(0.0f, 0.0f, -5.0f);

    // Enable depth test by default
    tglEnable(TGL_DEPTH_TEST);
    tglEnable(TGL_CULL_FACE);

    // Set up light (for Gouraud shading)
    float lightPosition[] = { 5.0f, 5.0f, 5.0f, 1.0f };
    float lightAmbient[] = { 0.2f, 0.2f, 0.2f, 1.0f };
    float lightDiffuse[] = { 1.0f, 1.0f, 1.0f, 1.0f };
    tglLightfv(TGL_LIGHT0, TGL_POSITION, lightPosition);
    tglLightfv(TGL_LIGHT0, TGL_AMBIENT, lightAmbient);
    tglLightfv(TGL_LIGHT0, TGL_DIFFUSE, lightDiffuse);

    // Set clear color
    tglClearColor(0.2f, 0.2f, 0.3f, 1.0f);

    // Main loop
    bool quit = false;
    SDL_Event e;
    float angle = 0.0f;
    clock_t lastTime = clock();
    clock_t modeStartTime = clock();
    int frames = 0;
    float fps = 0.0f;
    int testDuration = 8; // seconds per test
    int warmupDuration = 1; // seconds for warmup before measuring
    bool inWarmupPhase = true;

    printf("\n=== Starting TinyGL Benchmark ===\n");
    printf("Testing %d render modes for %d seconds each.\n", MODE_COUNT, testDuration);
    printf("Current mode: %s\n", modeNames[currentMode]);
    fflush(stdout);

    setupRenderMode(currentMode);

    while (!quit) {
        while (SDL_PollEvent(&e) != 0) {
            if (e.type == SDL_QUIT) {
                quit = true;
            } else if (e.type == SDL_KEYDOWN) {
                if (e.key.keysym.sym == SDLK_ESCAPE) {
                    quit = true;
                }
            }
        }

        // Clear the screen
        tglClear(TGL_COLOR_BUFFER_BIT | TGL_DEPTH_BUFFER_BIT);

        // Apply rotation
        tglMatrixMode(TGL_MODELVIEW);
        tglLoadIdentity();
        tglTranslatef(0.0f, 0.0f, -5.0f);
        tglRotatef(angle, 1.0f, 0.5f, 0.2f);
        angle += 1.0f;

        // Draw the cube with current render mode
        drawCube();

        // Present the TinyGL buffer (following the ScummVM pattern)
        Common::List<Common::Rect> dirtyAreas;
        TinyGL::presentBuffer(dirtyAreas);

        // Get the rendered surface
        Graphics::Surface glBuffer;
        TinyGL::getSurfaceRef(glBuffer);

#if ENABLE_DISPLAY
        // 1. Create a temporary SDL surface wrapping the TinyGL buffer
        // On little-endian, R=24 G=16 B=8 A=0 shift corresponds to ABGR format
        SDL_Surface* tempSurface = SDL_CreateRGBSurfaceWithFormatFrom(
            glBuffer.getPixels(),
            glBuffer.w,
            glBuffer.h,
            32, // Depth in bits (must match TinyGL)
            glBuffer.w * glBuffer.format.bytesPerPixel, // Pitch (bytes per row)
            SDL_PIXELFORMAT_RGBA8888 // Correct format for little-endian R=24,G=16,B=8,A=0
        );

        if (tempSurface) {
            // Ensure source surface is treated as opaque for the blit (no alpha blending)
            SDL_SetSurfaceBlendMode(tempSurface, SDL_BLENDMODE_NONE);

            // 2. Blit from the wrapper surface (RGBA) to the window surface (ARGB)
            // SDL_BlitSurface handles the format conversion automatically.
            SDL_BlitSurface(tempSurface, NULL, screen, NULL);

            // 3. Free the temporary wrapper surface
            SDL_FreeSurface(tempSurface);
        } else {
            // Fallback if surface creation failed (shouldn't normally happen)
            printf("Warning: Failed to create temporary SDL surface wrapper. Using memcpy.\n");
            memcpy(screen->pixels, glBuffer.getPixels(),
                   glBuffer.w * glBuffer.h * glBuffer.format.bytesPerPixel);
        }

        // Update the window
        SDL_UpdateWindowSurface(window);
#endif

        // Calculate FPS and update stats
        frames++;
        clock_t now = clock();
        // Check if a second has passed
        if (now - lastTime >= CLOCKS_PER_SEC) {
            fps = frames * ((float)CLOCKS_PER_SEC / (now - lastTime));
            frames = 0;
            lastTime = now;

            // Only update stats if we are past the warmup phase
            if (!inWarmupPhase) {
                ModeStats& stats = modeStats[currentMode];
                stats.totalFpsSum += fps;
                stats.measurementCount++;
                if (fps < stats.minFps) {
                    stats.minFps = fps;
                }
                if (fps > stats.maxFps) {
                    stats.maxFps = fps;
                }
                printf("Mode: %s, Current FPS: %.1f\n", modeNames[currentMode], fps);
                fflush(stdout);
            }
        }

        // Check for warmup phase completion
        clock_t elapsedModeTime = now - modeStartTime;
        if (inWarmupPhase && elapsedModeTime / CLOCKS_PER_SEC >= warmupDuration) {
            inWarmupPhase = false;
            modeStartTime = now; // Reset timer for measurement phase
            frames = 0;          // Reset frame count for measurement
            lastTime = now;      // Reset FPS calculation timer
            // Reset stats for the current mode just before measurement starts
            ModeStats& stats = modeStats[currentMode];
            stats.minFps = 1e9f;
            stats.maxFps = 0.0f;
            stats.totalFpsSum = 0.0;
            stats.measurementCount = 0;
            stats.avgFps = 0.0f;
        }

        // Auto-switch to next mode after test duration (only if not in warmup)
        if (!inWarmupPhase && elapsedModeTime / CLOCKS_PER_SEC >= testDuration) {
            // Calculate and store the average FPS result for the completed mode
            ModeStats& completedStats = modeStats[currentMode];
            if (completedStats.measurementCount > 0) {
                completedStats.avgFps = (float)(completedStats.totalFpsSum / completedStats.measurementCount);
                // Ensure minFps is not the initial large value if measurements occurred
                if (completedStats.minFps == 1e9f) completedStats.minFps = completedStats.avgFps; // Or 0.0f? Avg seems better.
            } else {
                // Handle case where no measurements were recorded in the duration
                completedStats.avgFps = 0.0f;
                completedStats.minFps = 0.0f;
                completedStats.maxFps = 0.0f;
            }
            modeCompleted[currentMode] = true;
            printf("Mode %s finished. Measurements: %d, Avg FPS: %.1f (Min: %.1f, Max: %.1f)\n",
                   modeNames[currentMode], completedStats.measurementCount, completedStats.avgFps, completedStats.minFps, completedStats.maxFps);
            fflush(stdout);


            // Move to next mode
            currentMode = (RenderMode)((currentMode + 1) % MODE_COUNT);

            // Check if we've completed all modes
            if (currentMode == MODE_FLAT && allModesCompleted()) {
                // All modes tested, print summary and quit
                printBenchmarkSummary(testDuration);
                quit = true;
                break;
            }

            setupRenderMode(currentMode);
            printf("\n--- Switching to next mode ---\n");
            printf("Current mode: %s\n", modeNames[currentMode]);
            fflush(stdout);
            modeStartTime = now;
            frames = 0;
            lastTime = now; // Reset FPS timer for the new mode's warmup
            inWarmupPhase = true; // Start in warmup for the new mode
        }

        // Throttle a bit to not eat all CPU
        SDL_Delay(10);
    }

    // Clean up
    tglDeleteTextures(1, &textureID);
    TinyGL::destroyContext(context);
#if ENABLE_DISPLAY
    SDL_DestroyWindow(window);
    SDL_Quit();
#endif

    return 0;
}
