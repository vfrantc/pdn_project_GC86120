import json
import pandas as pd
import matplotlib.pyplot as plt

# Load JSON data from the file
def load_data(filename):
    with open(filename, "r") as json_file:
        data = json.load(json_file)
    return data

# Process JSON data into a Pandas DataFrame
def process_data(data):
    df = pd.DataFrame(data["state"], columns=["state_value"])
    return df

# Visualize the data using a bar plot
def visualize_data(df):
    ax = df.plot(kind="bar", figsize=(10, 5), legend=False)
    ax.set_xlabel("Index")
    ax.set_ylabel("State Value")
    ax.set_title("State Value Bar Plot")
    plt.show()

# Main function
def main():
    data = load_data("system_state.json")
    df = process_data(data)
    visualize_data(df)

if __name__ == "__main__":
    main()

