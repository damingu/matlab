clear all;close all;
load('SearchData_from_200127.mat');

[R2_vs_Mask, A_vs_Mask] = PolyRegr(CoronaSearch, MaskSearch,1);
[R2_vs_Game, A_vs_Game] = PolyRegr(CoronaSearch, GameSearch,1);
[R2_vs_China, A_vs_China] = PolyRegr(CoronaSearch, ChinaSearch,1);
[R2_vs_Univ, A_vs_Univ]= PolyRegr(CoronaSearch, UniversitySearch,1);

[R2_vs_Mask, A_vs_Mask] = PolyRegr(CoronaSearch, MaskSearch,2);
[R2_vs_Game, A_vs_Game] = PolyRegr(CoronaSearch, GameSearch,2);
[R2_vs_China, A_vs_China] = PolyRegr(CoronaSearch, ChinaSearch,2);
[R2_vs_Univ, A_vs_Univ] = PolyRegr(CoronaSearch, UniversitySearch,2);
