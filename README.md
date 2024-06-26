![Static Badge](https://img.shields.io/badge/passing-gray?label=build&labelColor=gray&color=green) ![Static Badge](https://img.shields.io/badge/51.4%25-gray?label=Verilog&labelColor=gray&color=violet) ![Static Badge](https://img.shields.io/badge/31.6%25-gray?label=C&labelColor=gray&color=navy) ![Static Badge](https://img.shields.io/badge/17%25-gray?label=Jupyter&labelColor=gray&color=orange)

# 1D DCT (Discrete Cosine Transform) 
由 N. Ahmed, T. Natarajan, K.R. Rao 等人提出離散餘弦轉換（Discrete Cosine Transform），改以實部運算代替 FT 中的虛部運算，藉此達到簡化目的，且轉換後的效果更好。

## 功能
*  使用verilog實現1D DCT計算
*  使用testbench檢驗功能正常
*  讀取100組模擬測資，並用Modelsim模擬1D DCT輸出結果
*  Synthesis模擬預計使用面積(Area)、時間(Time)、功率(Power)
*  Pre-sim檢測電路功能正常
*  Primetime模擬更詳細的使用時間(Time)、功率(Power)

## 結果
*  Modelsim 100組測資

  ![image](https://github.com/TingKaiHsu0525/1DCT/assets/145333999/441bd13e-16c8-445f-bc23-44abc58efcbf)

*  Synthesis
   *   面積(Area)
   ![image](https://github.com/TingKaiHsu0525/1DCT/assets/145333999/96741cf0-4f44-4ebb-8bbc-a6292dbeef30)
   *    時間(Time)
     ![image](https://github.com/TingKaiHsu0525/1DCT/assets/145333999/846629a0-0a25-4347-942b-394196b748fb)
   *    功率(Power)
     ![image](https://github.com/TingKaiHsu0525/1DCT/assets/145333999/46217a93-cc3e-4f59-b70c-f51ede26234b)

*  Pre-sim

     ![image](https://github.com/TingKaiHsu0525/1DCT/assets/145333999/c07c7355-2f5a-44a1-a452-266ca8be6b7d)

*  Primetime
   *    時間(Time)
     ![image](https://github.com/TingKaiHsu0525/1DCT/assets/145333999/fa399603-f836-4a9e-87c1-8aff4c9cfb5e)
   *    功率(Power)
     ![image](https://github.com/TingKaiHsu0525/1DCT/assets/145333999/be65025e-7fd2-4ee8-b5a3-8d8c08f95b78)
