#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <limits.h>

int min(int a, int b) {
    return (a < b) ? a : b;
}

int findRotateSteps(char* ring, char* key) {
    int m = strlen(ring);
    int n = strlen(key);

    int* pos[26];
    for (int i = 0; i < 26; i++) {
        pos[i] = (int*)malloc(m * sizeof(int));
        memset(pos[i], -1, m * sizeof(int));
    }

    for (int i = 0; i < m; i++) {
        pos[ring[i] - 'a'][i] = i;
    }

    int dp[n + 1][m];
    for (int i = 0; i <= n; i++) {
        for (int j = 0; j < m; j++) {
            dp[i][j] = INT_MAX;
        }
    }

    dp[0][0] = 0;

    for (int i = 0; i < n; i++) {
        for (int j = 0; j < m; j++) {
            if (dp[i][j] == INT_MAX) continue;

            for (int k = 0; k < m; k++) {
                if (pos[key[i] - 'a'][k] == -1) continue;

                int dist = abs(j - k);
                int step = min(dist, m - dist); 

                dp[i + 1][k] = min(dp[i + 1][k], dp[i][j] + step + 1);
            }
        }
    }

    int result = INT_MAX;
    for (int j = 0; j < m; j++) {
        result = min(result, dp[n][j]);
    }

    for (int i = 0; i < 26; i++) {
        free(pos[i]);
    }

    return result;
}
