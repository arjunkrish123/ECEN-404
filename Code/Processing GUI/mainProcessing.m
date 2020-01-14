% Last updated: November 21, 2019

% main driver for processing (PCA)

% clear all
clear 

% PCA Processor global variables

global DataPCA; global Objects; global SpectraPerObject; global AllObjectsAdded;
global PCAXLower; global PCAXUpper; global PCALowerIndex; global PCAUpperIndex;
global peaksCorrected; global CorrectionWidth; global folderPath; global COEFF;
global SCORE;

% initialize (some) PCA Processor global variables

DataPCA = [];
Objects = {};
SpectraPerObject = [];
AllObjectsAdded = {};
PCAXLower = 0;
PCAXUpper = 0;
PCALowerIndex = 0;
PCAUpperIndex = 0;
peaksCorrected = 0;
CorrectionWidth = 0;
folderPath = '';
COEFF = nan;
SCORE = nan;

% initialize GUIs
PCAProcessorFig_App