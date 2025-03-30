import geopandas as gpd
import matplotlib.pyplot as plt
import pandas as pd
from shapely.geometry import Point

# Load the shapefile and UV index data
world_shapefile = gpd.read_file('ne_110m_admin_0_countries.shp')
uv_data = pd.read_csv('uv_data.csv')

# Convert UV data to a GeoDataFrame
uv_data_gdf = gpd.GeoDataFrame(uv_data, geometry=gpd.points_from_xy(uv_data.Longitude, uv_data.Latitude))

# Set same coordinate system
uv_data_gdf.crs = world_shapefile.crs

# Plot the map
fig, ax = plt.subplots(figsize=(15, 10))
world_shapefile.boundary.plot(ax=ax, color='black')  # plot world shapefile
# Overlay UV data points
scatter = ax.scatter(uv_data_gdf.geometry.x, uv_data_gdf.geometry.y, c=uv_data_gdf['UV_Index'], cmap='viridis',
                     marker='o', alpha=0.6)

# Add a colorbar
cbar = plt.colorbar(scatter, ax=ax)
cbar.set_label('UV Index')

# Add title
ax.set_title('World Map UV Index', fontsize=15)
ax.set_xlabel('Longitude', fontsize=12)
ax.set_ylabel('Latitude', fontsize=12)

# Saving the figure as a JPEG file
fig.savefig('uv_index_map.jpeg', format='jpeg', dpi=300)
plt.show()