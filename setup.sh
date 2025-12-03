#!/bin/bash

# Naive Bayes Spam Classifier - One-Command Setup Script
# Usage: ./setup.sh

set -e  # Exit on error

echo "=========================================="
echo "Naive Bayes Spam Classifier Setup"
echo "=========================================="
echo ""

# Check if uv is installed
if command -v uv &> /dev/null; then
    echo "✓ Found uv package manager"
    USE_UV=true
else
    echo "✗ uv not found, falling back to pip"
    USE_UV=false
fi

# Detect Python version
if command -v python3 &> /dev/null; then
    PYTHON_CMD=python3
elif command -v python &> /dev/null; then
    PYTHON_CMD=python
else
    echo "Error: Python not found. Please install Python 3.10+ first."
    exit 1
fi

PYTHON_VERSION=$($PYTHON_CMD --version 2>&1 | awk '{print $2}')
echo "✓ Found Python $PYTHON_VERSION"
echo ""

# Create virtual environment
if [ "$USE_UV" = true ]; then
    echo "Creating virtual environment with uv..."
    uv venv
else
    echo "Creating virtual environment with venv..."
    $PYTHON_CMD -m venv .venv
fi

# Activate virtual environment
echo "Activating virtual environment..."
if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
    source .venv/Scripts/activate
else
    source .venv/bin/activate
fi

# Install dependencies
echo ""
echo "Installing dependencies..."
if [ "$USE_UV" = true ]; then
    uv pip install -r requirements.txt
else
    pip install --upgrade pip
    pip install -r requirements.txt
fi

# Register Jupyter kernel
echo ""
echo "Registering Jupyter kernel..."
python -m ipykernel install --user --name=naive-bayes --display-name="naive-bayes (Python)" 2>/dev/null || true

echo ""
echo "=========================================="
echo "✓ Setup Complete!"
echo "=========================================="
echo ""
echo "To get started:"
echo "  1. Activate the environment:"
echo "     source .venv/bin/activate  (macOS/Linux)"
echo "     .venv\\Scripts\\activate     (Windows)"
echo ""
echo "  2. Run Jupyter:"
echo "     jupyter notebook"
echo ""
echo "  3. Open spam_classifier.ipynb and select the 'naive-bayes' kernel"
echo ""
echo "Or if using VS Code:"
echo "  1. Open spam_classifier.ipynb"
echo "  2. Select the 'naive-bayes (Python)' kernel"
echo "  3. Run all cells"
echo ""
