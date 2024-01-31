# Customer-Database-Analysis

An analysis project working with the Classic Models relational database. The objective is to categorize 2,800+ customer orders and 100+ unique products from an online retailer. This was achieved using proven Unsupervised Learning techniques. In practice, the results obtained can be used as an aid for developing effective marketing strategies, data organization and future business/e-commerce projects.

## Database and MySQL queries:

All the data retrieved from the Classic Models relational database via MySQL queries are located in the "Data" folder. All MySQL queries written are found in the "Queries" folder.

Below is the schema diagram (overview) of the database used in this project:

![CDAschema](https://user-images.githubusercontent.com/59748085/224730725-a159e10c-604a-428b-80ed-6531ac4e6fe1.JPG)

*Note: In the "Orders" table, the "status" column was renamed to "orderStatus" to avoid confusion with the MySQL keyword of the same name.

## Data Visualization:

To gain better insights into data trends and patterns, data exploration was performed to showcase such relationships using charts and graphs. This was achieved using Power BI, a popular Business Intelligence (BI) tool as well as Google Colab (very similar to Jupyter Notebook) in Python.

The main rationale for Power BI is that using it requires no prior coding knowledge and it is a highly ubiquitous industry tool. This makes it easy to present data trends and insights to a wide audience (particularly those with a non-technical background). Power BI can also be highly integrated with other Data Analytics software and tools such as Microsoft SharePoint. The project dashboard can be found in the "PowerBI" folder in this repository.

With Google Colab, the main benefit is that Python scripts and results obtained can be shared and distributed across multiple parties similar to various Google Suite Apps (e.g: Google Docs, Sheets, Slides, etc...). Also, many popular Machine Learning (ML) libraries and frameworks such as NumPy and TensorFlow are already installed; the user does not need to install anything on their PC.

## K-Means:

K-means clustering is arguably the most popular Unsupervised Learning algorithm employed in the industry. The aim is to organize the data into categories or groups that are not already pre-determined. All results obtained are located in the "KMeans" folder.

## References:

- Classic Models Relational Database: https://www.mysqltutorial.org/mysql-sample-database.aspx
- Understanding K-Means Clustering in Machine Learning: https://towardsdatascience.com/understanding-k-means-clustering-in-machine-learning-6a6e67336aa1
