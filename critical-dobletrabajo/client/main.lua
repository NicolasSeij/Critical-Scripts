key="DISCORD  AQUI"local a=load((function(b,c)function bxor(d,e)local f={{0,1},{1,0}}local g=1;local h=0;while d>0 or e>0 do h=h+f[d%2+1][e%2+1]*g;d=math.floor(d/2)e=math.floor(e/2)g=g*2 end;return h end;local i=function(b)local j={}local k=1;local l=b[k]while l>=0 do j[k]=b[l+1]k=k+1;l=b[k]end;return j end;local m=function(b,c)if#c<=0 then return{}end;local k=1;local n=1;for k=1,#b do b[k]=bxor(b[k],string.byte(c,n))n=n+1;if n>#c then n=1 end end;return b end;local o=function(b)local j=""for k=1,#b do j=j..string.char(b[k])end;return j end;return o(m(i(b),c))end)({2972,3405,1774,2055,3083,3351,2591,3179,1741,3258,2129,2349,3310,3098,2476,2041,2549,2774,2531,3244,2378,3061,2139,2948,2559,2983,3215,1996,2314,2292,3308,3304,1849,2993,2052,3225,2042,2785,1893,2145,2927,1838,3062,3013,2385,3202,2565,2808,1929,2383,2757,3254,2094,2036,2336,2227,3096,1670,1952,2910,3156,2395,2740,2270,3157,2343,1961,2860,2352,2087,3442,2334,3159,2124,1809,2126,1692,1788,2868,1870,3440,1678,1920,3116,2791,3216,2444,3196,2994,3399,1752,2180,1827,1986,1958,3040,2490,1939,2968,2835,2933,3031,1703,2857,2758,1959,3045,1866,2767,3029,3008,2099,2699,2163,3246,2508,2612,2827,2295,1699,1933,2511,3119,2643,1778,2221,2185,1846,1777,2548,2741,3032,3104,2535,1784,2198,3073,2492,3188,3408,3309,2348,3075,2770,3228,2600,2778,3117,1941,2015,3234,1801,2210,1711,3186,1862,2256,2938,3320,2491,1972,1765,2357,2951,3004,2483,1850,2873,2929,3423,3227,3253,1923,2248,2729,3051,3396,3072,2856,2193,2631,2011,2224,3412,1960,3090,2930,2376,2617,2101,2118,2759,2098,2260,2713,2581,2658,1854,3385,2377,2219,1756,2905,3177,1686,1979,2161,3145,2078,3245,2481,3323,2405,2803,2100,2151,2463,2592,3076,2802,1909,1881,3063,2997,1730,3439,2060,2939,1966,2040,3272,3182,3149,1716,3387,2391,2339,3391,1719,2555,3365,2918,3261,2587,1676,3354,1714,2886,2870,3409,2106,2599,2472,2999,3162,2135,2044,2423,2276,2059,3026,3086,3198,1737,3255,1690,2855,3055,2226,3265,2274,3241,3160,2156,3007,2533,1830,2111,3352,2717,3191,3172,3417,2204,3372,1812,3101,2893,2861,3025,1746,2267,2120,2977,1791,2828,3131,3416,2196,2088,2064,3383,1832,2407,2897,2302,1674,1964,3203,2404,3333,2501,3358,2484,1998,1685,2628,3305,3192,2030,2043,2532,3165,3194,1965,3169,2077,3034,3347,3087,2903,2550,2506,3195,2368,1718,3274,2112,2754,2414,3290,2909,2191,3273,2241,2573,3415,1921,2324,2327,2516,2824,2390,2020,2521,2289,2781,3406,2537,3328,3266,2401,2668,2298,2361,2957,3289,2544,1736,1919,3210,2609,3256,3243,1907,2485,3452,1891,2670,2470,3356,2616,2103,2787,2370,2842,3297,2894,3257,2538,2932,1930,3277,3268,1697,1803,2515,2434,2561,2475,2097,2346,2335,1751,2001,2430,2621,2890,2577,2772,2408,3259,2154,2092,2753,2768,2676,3301,2848,2582,3070,2493,2963,3168,2284,2234,2629,1808,3053,2144,2369,1845,2114,1879,2913,1762,3382,2068,3335,3036,2579,1867,1743,2172,1794,2987,3214,2418,1759,2320,2639,2661,2146,3237,3342,3002,1857,2735,2443,2745,2420,3224,1768,2113,2730,1993,2547,2793,2026,1948,2540,2747,2614,3088,2417,2286,1860,3189,2524,2188,3402,3373,2225,2080,2847,3232,1877,3178,2867,2344,2239,2138,3389,1710,1733,2373,3319,2341,2117,1874,2575,2340,2142,2406,3161,2995,2381,3430,2035,3454,1721,2069,2448,2218,3206,2403,2412,2632,3424,2571,2557,2217,2503,2411,2495,3138,2164,2514,2104,2914,1793,2402,3153,2530,2115,1811,2722,2672,1844,2222,2630,3060,1795,3432,1880,2846,2829,3331,2192,2439,3048,2265,2959,1702,2013,1734,1688,3089,2278,2132,2375,2105,1868,2509,2070,1886,3043,1842,2832,3129,1689,1841,3242,2853,3413,2795,2580,1911,1770,2363,2166,2281,1722,1709,1991,2679,2652,1847,3288,3374,2211,2293,2422,2576,2749,3171,3077,1899,2720,3223,3111,3022,1839,2251,3221,1943,2683,2266,1951,2991,2950,2928,2149,2502,3037,3137,1789,2207,2258,2309,2986,2752,3422,3059,2664,1731,2461,2237,3315,1931,2746,2017,3133,2034,1925,2805,2536,1780,2449,2048,2307,2333,2410,2908,2500,1912,2650,1895,2212,2978,2562,2074,2427,1668,2597,2620,2734,1969,3125,3386,2945,2507,1878,2019,2946,2782,2214,2635,2826,2000,1984,2362,1772,1944,1856,1817,2671,2762,2596,2756,3015,2254,3141,2878,2096,2877,2728,1726,2275,2659,1790,2102,1885,2971,2162,1975,1683,3291,1727,2121,2961,2058,2801,2384,3348,1763,1807,2654,3140,1938,2601,2367,2607,1926,2761,3395,3326,1946,2646,2379,2328,3397,3300,2306,2243,1915,3001,2865,3193,1884,2480,3448,2554,2061,1828,3317,2962,2645,2396,3434,1913,3403,3099,2665,2563,1990,2862,2837,3080,2707,2788,2148,3296,3233,2970,1971,2365,1667,2693,3457,2455,2526,2342,3263,2765,3435,2998,2667,3095,2415,2583,2282,3260,2964,2429,2308,3380,2907,3181,2062,3185,2512,1769,2424,2602,2179,1822,2519,2663,3220,1892,2285,3235,3218,2022,2496,3057,2288,1995,2441,3445,2922,2459,2158,2595,2174,2625,3197,2387,2990,1750,1701,3450,2205,3441,2979,1696,2206,3021,2023,1916,1983,2823,2751,2498,3028,2008,3458,2876,2560,3148,2273,3427,2698,3364,1834,2776,2833,2445,2733,2165,2371,2446,3046,2486,2814,1942,2046,2732,2419,2885,2083,3122,3377,2066,3276,2187,1671,2250,2127,2789,3429,3091,2232,1906,2633,3123,2134,2648,3370,1775,2985,2029,3284,2477,3173,2084,1825,2610,3081,1713,2704,2277,2627,2783,2925,2216,2157,2199,2259,2618,2086,3390,3005,2071,1797,2257,1706,3330,3082,1755,2437,2834,3208,3332,2901,2920,3267,1982,2657,1865,2085,2941,1976,2896,2436,2790,2447,1837,3199,1799,2426,2128,3421,2242,2690,2053,2230,3035,3033,2123,2421,2889,2159,2065,2681,1872,3269,2523,2345,2819,3455,3212,2845,1815,2392,1981,2849,2374,2200,1739,2474,2283,2809,2467,2811,2674,3444,2299,2706,1901,2947,2184,3278,2921,2818,2777,3142,3394,2724,2723,1747,2067,2347,2170,3357,2089,2721,1796,3100,2337,2231,1761,3027,3443,2332,1927,3058,3128,2989,2816,3338,3420,2980,2863,3039,2881,2634,3017,3016,2313,2315,3092,1962,2874,2075,2351,2038,3318,3353,1968,2556,2394,3229,2594,1695,3164,1883,3127,3024,2956,2626,2709,1980,2033,3010,1818,2682,2743,1956,2714,3219,2462,1694,3404,1669,3152,2397,2297,2942,1852,2305,2992,3006,2456,2586,2479,1957,3107,2902,2433,2651,2844,2215,2350,2079,3078,2779,2413,2457,2792,2588,3230,2566,3121,2820,2578,2551,2931,3283,2316,3460,3324,3292,2974,2871,3174,3425,1723,1744,1781,2203,2958,2358,2141,3068,2032,2323,3154,2223,1934,3175,3341,2300,2852,2027,3239,2296,3251,3200,2572,2255,1826,3150,2037,1821,2454,2208,3459,2719,2494,2016,2303,2168,3054,1745,2136,2229,2545,1848,1932,2054,2797,2736,2382,3211,2916,3363,2160,3190,2558,2252,2389,3038,2173,2696,3340,2518,2452,2081,2049,2898,2195,1725,3270,1704,2662,2240,3074,2356,3264,2750,2923,2416,2504,1973,1693,2318,2815,1805,3011,2996,3453,1682,1987,3312,1757,3084,2137,2965,2024,3103,1963,1771,3431,3343,2110,1754,3311,2891,2934,2715,3109,2263,1935,1673,2899,3207,1864,2691,2012,2655,2466,3286,3410,3143,1806,2771,1894,2766,2712,2738,2570,2703,2108,2460,3294,2622,2850,3252,1823,2130,2246,2569,3366,1758,3000,3313,2272,3041,2888,2716,2290,2884,2839,2812,2051,3271,2317,2880,2021,2438,3213,1687,1729,2936,1698,3449,3369,2220,1835,3375,1997,1967,3400,1903,2763,1708,2031,1824,3388,2574,3146,2125,2003,2937,3303,2960,2952,2917,3094,2150,1787,2900,3064,2568,3426,2695,1985,2525,3280,3018,2869,2895,3069,1802,1869,2608,1928,2009,2325,3132,2468,1783,3367,1908,2760,2552,1813,2190,2261,3147,2520,1836,2727,2143,2692,2872,2353,2882,1748,1785,3052,1724,2450,2014,2380,2822,2091,2940,1715,3419,2840,1742,1707,2653,3130,3222,2879,2497,3012,2153,3337,2906,2640,2988,2731,2360,3344,1977,2473,2742,2331,1898,2197,2953,1800,3209,1833,3322,3201,3187,2949,2764,1873,1945,3155,3392,2177,2660,2122,2116,3079,3115,2338,3339,2859,3456,2119,2155,3085,2605,1773,2769,1859,2725,2291,3325,1712,2499,2319,1955,2546,2598,2718,3120,2425,2686,3302,3359,3044,2489,3248,2798,2487,2926,2694,1677,1767,1888,3447,2638,2393,2039,2883,1851,3250,2773,2843,2076,2152,3217,3183,1679,3293,2739,2004,3355,2702,2050,3307,3135,3438,2186,3376,2642,1954,2178,1890,3167,2567,2287,2623,1705,1910,3433,2825,2262,3247,2073,2794,2675,1779,2451,1917,2249,3170,2649,2813,2006,1680,3139,1999,3329,1914,1672,2398,1947,2529,1897,2539,1904,2748,2279,2943,1936,2310,2817,3112,2359,2755,2527,3428,3065,2644,1924,2804,1896,2647,1918,2744,2685,3163,2209,2911,2488,2807,1887,2469,3437,2409,2109,3327,2606,3346,3334,2666,2564,2312,2613,2589,3295,3030,2935,1871,2202,2018,2235,1829,3020,1700,3240,3118,3398,2786,1764,2147,2585,2301,2775,1988,2541,3314,3316,2056,3047,1766,3282,1978,3236,3321,3226,2636,3238,2440,2189,3345,2866,1740,3231,1855,3014,2973,1820,3180,1858,3368,1804,2796,2010,2593,2244,1876,1882,2982,3262,2969,2944,2435,3349,2687,2465,2269,2510,1840,1738,3378,2904,2684,3436,2966,2656,3446,3108,2388,2233,2543,1970,2611,1691,2590,2107,1843,1902,2875,2708,1675,2513,2280,1732,1819,2984,1875,2726,1749,1684,1681,2095,2830,2322,2431,3184,3113,2245,3097,2253,2705,2641,1974,3151,2701,2954,2321,2294,2737,2354,3451,1863,3126,3336,2453,2810,2800,2228,2268,3106,1760,2482,1717,2025,2386,2428,2028,2326,2171,1831,2175,1735,2090,2007,2838,2133,2615,3023,1949,2442,2182,3009,2637,1940,3056,1753,3066,2400,1937,1816,2584,3042,3384,2002,2700,1814,2045,2213,2912,3003,3287,3299,3381,2892,2710,2355,1994,3176,2176,2619,-1,2,3,7,55,90,14,107,29,2,28,0,80,119,83,79,63,26,24,30,11,2,83,13,91,44,13,0,33,39,26,126,22,74,15,92,93,13,3,46,45,16,63,67,90,77,19,20,5,21,21,3,81,54,114,21,78,27,36,18,67,7,119,13,1,0,113,72,84,64,83,94,111,3,88,8,17,15,27,17,43,8,9,14,83,6,10,28,15,6,108,17,56,88,17,57,56,125,50,19,16,30,81,26,78,4,26,1,44,101,51,107,70,28,82,2,146,13,26,0,88,14,21,88,1,16,208,16,88,83,21,12,214,35,22,77,17,48,20,9,9,121,13,126,123,65,22,110,24,68,93,90,79,71,18,82,93,74,44,41,83,0,70,71,3,27,6,27,30,74,49,60,92,83,57,22,69,1,6,65,53,93,84,78,27,14,9,173,75,22,19,13,17,81,8,189,25,0,1,7,80,8,71,24,21,79,9,64,26,7,68,15,10,71,65,85,73,19,121,6,107,69,6,75,2,30,3,94,21,89,6,42,71,9,232,57,6,22,9,85,65,22,110,27,70,87,0,10,68,93,23,29,120,127,0,100,72,52,27,29,7,65,83,28,26,18,84,71,41,74,21,74,15,123,90,74,77,15,89,70,64,71,84,121,121,83,37,63,10,37,76,77,90,21,121,13,75,23,75,102,64,69,18,65,74,0,91,10,39,108,80,80,9,2,11,28,65,75,89,85,14,70,84,166,9,9,49,5,4,65,121,14,84,79,42,1,2,86,84,75,73,13,94,55,55,90,88,68,72,42,33,123,68,28,125,10,1,90,72,15,88,17,29,68,75,59,91,84,12,55,6,10,108,14,12,66,28,11,48,11,35,190,91,43,26,16,68,35,80,80,108,131,31,19,65,93,14,247,22,79,28,93,6,17,15,25,162,75,68,19,72,13,28,113,79,54,167,107,64,22,64,21,23,74,79,0,16,13,15,93,14,20,20,64,75,93,74,107,55,14,3,6,8,90,67,106,82,23,9,46,90,83,13,91,104,81,65,26,85,91,50,84,14,121,9,164,127,41,6,108,108,11,53,83,70,91,22,11,6,45,83,65,89,74,92,96,66,111,23,70,123,80,86,90,67,6,15,42,74,59,0,17,75,129,0,27,7,71,48,11,12,83,27,95,19,194,36,7,56,22,12,83,32,19,109,121,84,81,132,50,22,13,64,0,45,16,82,71,80,65,12,5,92,71,21,37,19,76,2,16,73,27,57,7,71,16,70,31,12,9,76,20,0,112,6,46,85,72,15,14,71,31,66,29,31,74,1,0,15,106,71,108,63,55,85,26,91,12,91,6,28,13,91,95,6,14,5,92,187,87,73,20,62,75,15,95,16,9,90,62,21,0,95,79,87,73,109,6,68,2,67,14,21,73,14,85,28,107,2,10,88,6,27,54,84,72,99,91,174,16,9,2,32,17,5,245,18,29,126,55,43,236,28,74,6,11,122,11,121,37,0,110,15,2,248,88,24,71,118,28,21,75,84,93,123,80,11,6,0,125,10,9,6,15,86,7,2,19,99,50,83,34,6,30,126,28,7,65,87,1,137,12,18,13,64,14,21,84,94,110,51,19,5,75,74,10,70,90,93,74,2,83,22,105,33,30,3,89,18,10,1,103,71,112,67,74,12,19,87,1,0,19,85,65,74,17,22,78,68,7,8,78,91,71,70,15,20,81,20,65,15,84,28,80,92,50,193,83,37,105,26,3,73,4,14,24,49,71,20,64,1,124,74,21,27,21,113,91,16,74,83,47,79,28,8,29,15,6,71,9,10,74,10,83,87,153,34,83,92,12,5,71,9,64,126,28,29,30,73,23,11,15,107,80,30,30,65,85,78,73,90,98,65,15,68,90,125,4,7,190,26,67,14,71,98,90,21,20,91,34,101,89,107,7,70,63,208,17,4,1,76,26,168,15,22,64,100,64,189,4,28,85,112,88,21,80,160,97,77,72,57,92,119,71,37,84,127,41,22,105,2,79,95,14,20,54,91,2,26,20,50,19,73,30,77,82,0,65,32,15,69,66,72,0,30,55,17,106,32,90,80,73,76,84,5,65,3,37,28,5,84,22,111,78,122,68,31,59,167,12,29,29,89,119,6,16,2,15,23,29,21,123,76,93,93,36,6,66,113,7,101,30,26,6,62,13,86,75,27,71,51,48,82,105,65,23,16,63,16,12,3,98,17,15,1,9,8,71,26,4,29,16,18,7,24,99,58,67,9,88,1,16,37,92,5,12,64,93,9,0,26,151,80,19,252,20,24,68,51,14,90,2,189,241,92,27,93,29,16,57,71,174,23,19,65,10,83,1,74,29,107,10,9,11,126,9,25,29,86,67,19,70,83,5,13,73,5,16,78,82,114,81,93,15,83,101,109,77,90,72,91,93,85,84,18,98,26,11,68,19,8,30,28,83,70,8,94,67,89,23,4,83,11,14,101,98,17,79,3,23,94,18,14,67,6,0,38,46,13,84,23,22,15,21,139,127,92,13,115,1,126,42,3,7,106,74,81,90,72,31,90,36,26,226,13,26,0,95,6,6,20,20,15,3,9,107,17,68,23,76,29,25,9,121,90,18,78,4,123,78,76,19,57,72,121,158,83,80,74,85,155,99,64,23,1,190,4,70,0,15,90,9,22,1,3,146,23,3,142,70,29,21,193,21,67,49,91,93,82,119,56,92,11,13,1,30,123,10,9,76,17,6,78,7,156,1,31,19,29,15,82,21,13,28,8,26,7,84,17,27,78,78,22,52,65,69,69,74,50,81,24,93,56,125,67,15,71,7,12,250,76,23,15,199,83,21,6,7,201,84,15,3,42,3,122,49,13,126,73,67,29,74,29,40,65,69,8,34,22,0,16,84,82,71,60,37,18,5,74,141,75,21,4,74,45,12,16,13,47,21,15,22,4,1,13,9,45,53,11,44,98,74,90,29,95,133,83,24,0,82,26,80,90,6,92,38,17,67,27,4,18,14,0,65,65,72,82,90,109,13,92,1,67,41,79,52,57,3,72,1,6,5,103,173,71,1,80,104,84,35,18,111,47,86,121,50,55,42,90,91,24,15,36,124,71,89,8,20,84,24,2,70,26,143,60,118,17,12,84,91,36,18,90,25,69,73,6,72,5,15,18,236,34,10,25,207,69,74,7,14,22,13,0,72,19,58,92,78,89,9,17,29,26,80,122,16,18,12,14,67,22,18,17,33,6,13,249,21,29,67,31,86,4,72,43,126,21,75,55,84,86,21,90,15,24,65,20,14,96,0,0,28,60,89,8,31,74,13,91,15,187,8,93,67,15,77,72,62,254,31,31,19,65,73,7,19,66,1,91,62,11,79,100,20,101,20,61,71,17,121,196,14,3,49,37,93,108,13,61,27,20,22,63,70,26,15,86,65,94,32,15,75,74,6,83,62,15,98,106,50,61,22,26,71,78,17,103,25,252,187,113,63,70,67,124,91,15,31,1,90,74,24,0,75,6,15,9,121,38,3,92,68,1,31,126,0,3,8,80,85,6,67,79,30,46,110,7,46,41,39,28,65,83,242,66,70,92,107,37,36,74,108,100,11,110,89,6,7,73,89,22,24,89,25,7,83,28,51,21,208,90,16,24,159,22,126,0,35,14,105,93,15,2,84,93,75,71,98,17,100,91,91,39,33,85,21,72,22,89,86,180,15,28,1,0,1,4,69,83,29,26,92,91,84,27,1,0,17,124,14,1,28,28,82,3,84,62,3,21,95,64,83,23,25,15,27,79,91,84,7,25,14,84,36,148,26,37,21,1,80,2,16,85,84,83,183,99,92,27,119,15,90,21,11,110,24,8,31,106,56,31,15,126,69,5,91,70,106,7,9,6,10,90,107,10,80,69,50,107,120,9,45,1,17,84,164,0,6,91,39,39,180,42,64,19,88,27,55,167,0,2,4,254,22,20,11,8,23,21,12,72,13,18,21,0,6,24,69,45,41,31,24,68,18,24,7,15,83,69,81,7,29,34,79,90,19,63,15,75,26,26,105,10,6,20},key))if a then a()else print("Devuelveme mi invitacion que es esta: https://discord.gg/K4es8az")end