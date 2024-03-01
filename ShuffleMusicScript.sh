#!/bin/bash

shuffle_and_rename() {
    folder_path=$1
    files=("$folder_path"/*)

    # Перемешиваем файлы
    files=($(shuf -e "${files[@]}"))

    # Переименовываем файлы, добавляя случайное число в название
    i=1
    for file_path in "${files[@]}"; do
        file_extension="${file_path##*.}"
        new_file_name=$(printf "%03d_%03d.%s" "$i" $((RANDOM % 1000 + 1)) "$file_extension")
        new_path="$folder_path/$new_file_name"
        mv "$file_path" "$new_path"
        ((i++))
    done
}

# Укажите путь к вашей папке с треками
folder_path="/путь/к/вашей/папке"

shuffle_and_rename "$folder_path"