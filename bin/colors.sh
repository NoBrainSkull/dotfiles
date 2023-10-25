#!/bin/sh

scheme_path="./colors.txt"
color_0=$(awk -F "=" '/\<color0\>/ {print $2}' $scheme_path)
color_1=$(awk -F "=" '/\<color1\>/ {print $2}' $scheme_path)
color_2=$(awk -F "=" '/\<color2\>/ {print $2}' $scheme_path)
color_3=$(awk -F "=" '/\<color3\>/ {print $2}' $scheme_path)
color_4=$(awk -F "=" '/\<color4\>/ {print $2}' $scheme_path)
color_5=$(awk -F "=" '/\<color5\>/ {print $2}' $scheme_path)
color_6=$(awk -F "=" '/\<color6\>/ {print $2}' $scheme_path)
color_7=$(awk -F "=" '/\<color7\>/ {print $2}' $scheme_path)
color_8=$(awk -F "=" '/\<color8\>/ {print $2}' $scheme_path)
color_9=$(awk -F "=" '/\<color9\>/ {print $2}' $scheme_path)
color_10=$(awk -F "=" '/\<color10\>/ {print $2}' $scheme_path)
color_11=$(awk -F "=" '/\<color11\>/ {print $2}' $scheme_path)
color_12=$(awk -F "=" '/\<color12\>/ {print $2}' $scheme_path)
color_13=$(awk -F "=" '/\<color13\>/ {print $2}' $scheme_path)
color_14=$(awk -F "=" '/\<color14\>/ {print $2}' $scheme_path)
color_15=$(awk -F "=" '/\<color15\>/ {print $2}' $scheme_path)

html_color_grid='
<html>
	<head>
		<title>scheme preview</title>
	</head>
	<body>
		<table>
			<tr><td>0</td><td><div style="height: 40px;width: 40px;margin:2px;background-color:%s;" />
			<tr><td>1</td><td><div style="height: 40px;width: 40px;margin:2px;background-color:%s;" />
			<tr><td>2</td><td><div style="height: 40px;width: 40px;margin:2px;background-color:%s;" />
			<tr><td>3</td><td><div style="height: 40px;width: 40px;margin:2px;background-color:%s;" />
			<tr><td>4</td><td><div style="height: 40px;width: 40px;margin:2px;background-color:%s;" />
			<tr><td>5</td><td><div style="height: 40px;width: 40px;margin:2px;background-color:%s;" />
			<tr><td>6</td><td><div style="height: 40px;width: 40px;margin:2px;background-color:%s;" />
			<tr><td>7</td><td><div style="height: 40px;width: 40px;margin:2px;background-color:%s;" />
			<tr><td>8</td><td><div style="height: 40px;width: 40px;margin:2px;background-color:%s;" />
			<tr><td>9</td><td><div style="height: 40px;width: 40px;margin:2px;background-color:%s;" />
			<tr><td>10</td><td><div style="height: 40px;width: 40px;margin:2px;background-color:%s;" />
			<tr><td>11</td><td><div style="height: 40px;width: 40px;margin:2px;background-color:%s;" />
			<tr><td>12</td><td><div style="height: 40px;width: 40px;margin:2px;background-color:%s;" />
			<tr><td>13</td><td><div style="height: 40px;width: 40px;margin:2px;background-color:%s;" />
			<tr><td>14</td><td><div style="height: 40px;width: 40px;margin:2px;background-color:%s;" />
			<tr><td>15</td><td><div style="height: 40px;width: 40px;margin:2px;background-color:%s;" />
		</table>
	</body>
</html>
'


printf "$html_color_grid" $color_0 $color_1 $color_2 $color_3 $color_4 $color_5 $color_6 $color_7 $color_8 $color_9 $color_10 $color_11 $color_12 $color_13 $color_14 $color_15
