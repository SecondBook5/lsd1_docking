# PyMOL script to visualize the docking grid box
# This script uses pseudoatoms to create a visual box representing the docking grid

# Fetch the protein structure
fetch 2UXX, async=0

# Select the ligand by residue name FAJ
select ligand, resn FAJ

# Center the view on the selected ligand
center ligand

# Define pseudoatoms to represent the corners of the docking grid box
pseudoatom pos1, pos=[54.33, 51.66, 18.96]
pseudoatom pos2, pos=[79.33, 51.66, 18.96]
pseudoatom pos3, pos=[79.33, 76.66, 18.96]
pseudoatom pos4, pos=[54.33, 76.66, 18.96]
pseudoatom pos5, pos=[54.33, 51.66, 43.96]
pseudoatom pos6, pos=[79.33, 51.66, 43.96]
pseudoatom pos7, pos=[79.33, 76.66, 43.96]
pseudoatom pos8, pos=[54.33, 76.66, 43.96]

# Use distance commands to create lines connecting the pseudoatoms, forming a box
distance d1, pos1, pos2
distance d2, pos2, pos3
distance d3, pos3, pos4
distance d4, pos4, pos1
distance d5, pos5, pos6
distance d6, pos6, pos7
distance d7, pos7, pos8
distance d8, pos8, pos5
distance d9, pos1, pos5
distance d10, pos2, pos6
distance d11, pos3, pos7
distance d12, pos4, pos8

# Optionally hide the pseudoatoms themselves and just show the box
hide spheres, pos*
show lines, d*

# Set up the view for easy visualization
orient ligand
