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

input_file=$1
output_file=$2

if [ -e $output_file ]; then
	output_file="${input_file/.template/''}"
fi

echo "INPUT FILE: $input_file"
echo "OUTPUT FILE: $output_file"

cat $input_file \
	| sed "s/#!color_0!#/$color_0/g" \
	| sed "s/#!color_1!#/$color_1/g" \
	| sed "s/#!color_2!#/$color_2/g" \
	| sed "s/#!color_3!#/$color_3/g" \
	| sed "s/#!color_4!#/$color_4/g" \
	| sed "s/#!color_5!#/$color_5/g" \
	| sed "s/#!color_6!#/$color_6/g" \
	| sed "s/#!color_7!#/$color_7/g" \
	| sed "s/#!color_8!#/$color_8/g" \
	| sed "s/#!color_9!#/$color_9/g" \
	| sed "s/#!color_10!#/$color_10/g" \
	| sed "s/#!color_11!#/$color_11/g" \
	| sed "s/#!color_12!#/$color_12/g" \
	| sed "s/#!color_13!#/$color_13/g" \
	| sed "s/#!color_14!#/$color_14/g" \
	| sed "s/#!color_15!#/$color_15/g" \
	> $output_file

