import os

def remove_spaces_from_filenames(directory_path):
    # Get the list of files in the directory
    files = os.listdir(directory_path)
    
    for filename in files:
        if " " in filename:  # Check if the filename contains spaces
            new_filename = filename.replace(" ", "")  # Remove spaces from the filename
            old_filepath = os.path.join(directory_path, filename)
            new_filepath = os.path.join(directory_path, new_filename)
            
            # Rename the file
            os.rename(old_filepath, new_filepath)
            print(f"Renamed: {filename} -> {new_filename}")

if __name__ == "__main__":
    # Replace 'your_directory_path' with the path of the directory containing the files you want to rename
    directory_path = "/home/pverma/devwork/digital-properties/acmandi/data_loader/products"
    remove_spaces_from_filenames(directory_path)
