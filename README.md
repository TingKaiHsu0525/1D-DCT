# 1DCT (Discrete Cosine Transform)
由 N. Ahmed, T. Natarajan, K.R. Rao 等人提出離散餘弦轉換（Discrete Cosine Transform），改以實部運算代替 FT 中的虛部運算，藉此達到簡化目的，且轉換後的效果更好。

## 功能
*  使用verilog實現1DCT計算
*  使用testbench檢驗功能正常
*  讀取100組模擬測資，並用Modelsim模擬1DCT輸出結果
*  Synthesis模擬預計使用面積(Area)、時間(Time)、功率(Power)
*  Pre-sim檢測電路功能正常
*  Primetime模擬更詳細的使用時間(Time)、功率(Power)

## 結果
*  Synthesis
  * 面積(Area)
  * ![image](https://github.com/TingKaiHsu0525/1DCT/assets/145333999/96741cf0-4f44-4ebb-8bbc-a6292dbeef30)
