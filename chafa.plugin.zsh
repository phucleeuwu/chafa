random_ascii() {
  local img_url="https://picsum.photos/300/300"  # Smaller source image
  local img_file="/tmp/random_image.jpg"
  local converted_img="/tmp/random_image.png"

  # Download the image
  curl -sL "$img_url" -o "$img_file"

  # Validate if the file is an actual image
  if ! file "$img_file" | rg -q "JPEG|PNG|GIF"; then
    echo "Error: Downloaded file is not a valid image."
    rm -f "$img_file"
    return 1
  fi

  # Convert to PNG if necessary
  magick "$img_file" "$converted_img"

  # Display in ASCII with slightly smaller size
  chafa --symbols=block --size=32x16 "$converted_img"

  # Cleanup
  rm -f "$img_file" "$converted_img"
}
random_ascii
