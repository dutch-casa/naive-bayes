# Naive Bayes Spam Classifier - Setup Instructions

This guide will help you set up and run the Naive Bayes spam classifier notebook on any machine.

## Prerequisites

- **Python 3.13+** (or Python 3.10+)
- **uv** package manager (recommended) or **pip**

## Installation Steps

### Option 1: Using `uv` (Recommended)

1. **Install uv** (if not already installed):
   ```bash
   curl -LsSf https://astral.sh/uv/install.sh | sh
   ```

2. **Clone/Download the project** and navigate to the directory:
   ```bash
   cd /path/to/naive-bayes
   ```

3. **Create a virtual environment**:
   ```bash
   uv venv
   ```

4. **Activate the virtual environment**:
   ```bash
   source .venv/bin/activate  # On macOS/Linux
   # or
   .venv\Scripts\activate     # On Windows
   ```

5. **Install dependencies**:
   ```bash
   uv pip install polars matplotlib seaborn wordcloud scikit-learn requests jupyter ipykernel
   ```

6. **Register the Jupyter kernel**:
   ```bash
   python -m ipykernel install --user --name=naive-bayes --display-name="naive-bayes (Python 3.13)"
   ```

### Option 2: Using `pip`

1. **Create a virtual environment**:
   ```bash
   python3 -m venv .venv
   ```

2. **Activate the virtual environment**:
   ```bash
   source .venv/bin/activate  # On macOS/Linux
   # or
   .venv\Scripts\activate     # On Windows
   ```

3. **Install dependencies**:
   ```bash
   pip install polars matplotlib seaborn wordcloud scikit-learn requests jupyter ipykernel
   ```

4. **Register the Jupyter kernel**:
   ```bash
   python -m ipykernel install --user --name=naive-bayes --display-name="naive-bayes (Python 3.13)"
   ```

## Running the Notebook

### Using Jupyter Notebook

1. **Start Jupyter**:
   ```bash
   jupyter notebook
   ```

2. **Open** `spam_classifier.ipynb` in the browser

3. **Select the kernel**: Click "Kernel" → "Change kernel" → "naive-bayes (Python 3.13)"

4. **Run all cells**: Click "Cell" → "Run All"

### Using VS Code

1. **Open the project** in VS Code

2. **Open** `spam_classifier.ipynb`

3. **Select the kernel**: Click the kernel selector in the top-right → Choose "naive-bayes (Python 3.13)"

4. **Run cells**: Click "Run All" or run cells individually

## Expected Output

The notebook will:
1. Download the Enron-Spam dataset automatically (~10 seconds)
2. Preprocess the data
3. Train the Naive Bayes classifier (counting-based, very fast)
4. Generate visualizations:
   - Class distribution
   - Message length distribution
   - Word clouds (original data)
   - Confusion matrix
   - Classification report
   - **Word clouds from predictions** (what the model learned)

**Expected Accuracy**: ~98%

## Troubleshooting

### "Jupyter command not found"
- Make sure the virtual environment is activated
- Re-run: `uv pip install jupyter` or `pip install jupyter`

### Kernel not showing up
- Re-register the kernel:
  ```bash
  python -m ipykernel install --user --name=naive-bayes --display-name="naive-bayes (Python 3.13)"
  ```
- Reload VS Code window (Cmd+Shift+P → "Developer: Reload Window")

### Dataset download fails
- Check your internet connection
- The notebook will automatically download from: `https://github.com/MWiechmann/enron_spam_data`

### Import errors
- Verify all packages are installed:
  ```bash
  pip list | grep -E "polars|matplotlib|seaborn|wordcloud|scikit-learn"
  ```

## Dependencies

- **polars** (1.35.2): Fast CSV reading and data manipulation
- **matplotlib** (3.10.7): Plotting library
- **seaborn** (0.13.2): Statistical visualizations
- **wordcloud** (1.9.4): Word cloud generation
- **scikit-learn** (1.7.2): Metrics (confusion matrix, classification report)
- **requests** (2.32.5): Dataset downloading
- **jupyter** (1.1.1): Notebook interface
- **ipykernel** (7.1.0): Jupyter kernel

## Project Structure

```
naive-bayes/
├── spam_classifier.ipynb    # Main notebook
├── pyproject.toml           # Project metadata
├── SETUP.md                 # This file
├── enron_spam_data.csv      # Auto-downloaded dataset
└── .venv/                   # Virtual environment (created during setup)
```

## Notes

- The dataset is ~33K emails (16.5K spam, 16.5K ham)
- Training is very fast (< 5 seconds) since it's just counting
- The model uses the top 10,000 most common words
- All visualizations are generated automatically
