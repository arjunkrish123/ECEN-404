% Last updated: November 20, 2019

% main driver for excitation monochromator (set and rotate grating) and
% emission monochromator (set and read CCD)

% clear all

clear

%% Excitation Monochromator global variables

global Monochromator; global motorDetected; global referenceLine; 
global numSteps; global totalSteps; global modeSelected;
global StartEX; global FinalEX; global prevWavelength;
global RESOLUTION;

%% Spectrometer global variables
% for Ports list
global serialList; global serialPortSelected; global Spectrometer;
global spectrometerDetected;

% communicating with spectrometer
global AcquiredSpectrum; global AveragedSpectrum;
global isEmissionScan; global AVERAGE; global INTEGRATIONTIME; 
global EX; global EM; global EEM; global BackgroundEEM; global CorrectedEEM; 
global ProcessedEEM; global WINDOW;

% plot window traits
global XLimLow; global XLimUpp; global YLimLow; global YLimUpp;

% processing 
global MultipleSpectra; global PlottedSpectra; global PlottedSpectraStrs;
global endAcquisition; global folderPath; global saveSpectrum; global spectraWritten;

% calibration (polynomial fitting)
global isCalibrated; global calibratedPixels; global calibratedWavelengths;
global polyFit;

% for taking spectra continuously
global isContinuous;

% background subtraction
global BackgroundSpectrum; global backSub;

% WAITBAR and ERROR LOG traits
global BAR; global TAG; global WARNINGS;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% initialize Excitation Monochromator global variables

Monochromator = ''; motorDetected = 0; referenceLine = nan; numSteps = nan; totalSteps = 0;
modeSelected = 0; StartEX = nan; FinalEX = nan; prevWavelength = nan;
RESOLUTION = nan;

%% initialize Spectrometer global variables

serialList = []; serialPortSelected = ''; Spectrometer = ''; 
spectrometerDetected = 0;

AVERAGE = 1;            % default 
INTEGRATIONTIME = 50;   % [ms] default
isEmissionScan = nan;   % default
AcquiredSpectrum = [];
AveragedSpectrum = [];
EX = [];
EM = [];
EEM = [];
BackgroundEEM = [];
CorrectedEEM = [];
ProcessedEEM = [];
WINDOW = nan;    % median window

XLimLow = 0; XLimUpp = 0; YLimLow = 0; YLimUpp = 0; 

MultipleSpectra = 0; PlottedSpectra = []; PlottedSpectraStrs = {}; 
endAcquisition = 0; folderPath = ''; saveSpectrum = 0; spectraWritten = 0;

isCalibrated = 0; 
calibratedPixels = [351 506 631 847 1560];                      % by default              
calibratedWavelengths = [365 405 436 487 651];                  % by default
polyFit = polyfit(calibratedPixels,calibratedWavelengths,3);    % by default

isContinuous = 0;

BackgroundSpectrum = []; backSub = 0;

BAR = []; TAG = []; WARNINGS = 0;

% initialize GUIs

SpectrumAcquisition_App