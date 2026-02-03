# Research Project - Spring 2026

**Advisor:** Professor Suining He

## Overview

This research explores the transition from atomic action classification to sequential assembly understanding in egocentric vision tasks.

## Project Goal

Investigate and explain the shift from atomic classification approaches to sequential assembly methods for understanding complex, multi-step activities in first-person video data.

## Datasets

### Primary Datasets

- **[Ego-Exo4D](https://ego-exo4d-data.org/)** (Bike Repair Scenario)
  - Large-scale egocentric and exocentric video dataset
  - Focus on bike repair activities for procedural understanding
  
- **[Egocentric-10K](https://github.com/your-link-here)**
  - Comprehensive egocentric action recognition dataset
  - 10,000+ egocentric video samples across diverse activities

## Repository Structure

```
.
├── data/              # Dataset storage
├── scripts/           # Data processing and training scripts
├── models/            # Model architectures and checkpoints
├── notebooks/         # Jupyter notebooks for analysis
└── logs/              # Experiment logs and outputs
```

## Getting Started

### Prerequisites

```bash
# Create virtual environment
python3 -m venv .venv
source .venv/bin/activate

# Install dependencies
pip install -r requirements.txt
```

### Data Download

Instructions for downloading Ego-Exo4D data can be found in `scripts/bike_repair_download.sh`.
.

---

*Last updated: February 3, 2026*