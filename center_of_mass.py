def calculate_center_of_mass(file_path: str):
    # Initialize variables to store the sum of coordinates and atom count
    sum_x, sum_y, sum_z = 0.0, 0.0, 0.0
    atom_count = 0

    # Read the file containing FAJ atoms
    with open(file_path, 'r') as file:
        for line in file:
            if line.startswith("HETATM"):
                # Extract the x, y, z coordinates from the line
                x = float(line[30:38].strip())
                y = float(line[38:46].strip())
                z = float(line[46:54].strip())

                # Add to the running totals
                sum_x += x
                sum_y += y
                sum_z += z

                # Increment the atom count
                atom_count += 1

    # Calculate the average (center of mass)
    center_x = sum_x / atom_count
    center_y = sum_y / atom_count
    center_z = sum_z / atom_count

    return center_x, center_y, center_z


# File path to your saved FAJ atom data
file_path = "faj_atoms.txt"

# Calculate and print the center of mass
center_of_mass = calculate_center_of_mass(file_path)
print(f"Center of Mass (x, y, z): {center_of_mass}")
