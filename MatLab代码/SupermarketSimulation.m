function varargout = SupermarketSimulation(varargin)
%���η��洰��

% SUPERMARKETSIMULATION MATLAB code for SupermarketSimulation.fig
%      SUPERMARKETSIMULATION, by itself, creates a new SUPERMARKETSIMULATION or raises the existing
%      singleton*.
%
%      H = SUPERMARKETSIMULATION returns the handle to a new SUPERMARKETSIMULATION or the handle to
%      the existing singleton*.
%
%      SUPERMARKETSIMULATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SUPERMARKETSIMULATION.M with the given input arguments.
%
%      SUPERMARKETSIMULATION('Property','Value',...) creates a new SUPERMARKETSIMULATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SupermarketSimulation_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SupermarketSimulation_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SupermarketSimulation

% Last Modified by GUIDE v2.5 17-May-2018 16:36:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SupermarketSimulation_OpeningFcn, ...
                   'gui_OutputFcn',  @SupermarketSimulation_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before SupermarketSimulation is made visible.
function SupermarketSimulation_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SupermarketSimulation (see VARARGIN)

% Choose default command line output for SupermarketSimulation
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SupermarketSimulation wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SupermarketSimulation_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h=gcf;
 Halton_Gui_Form;



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
h=gcf;
main_form;



% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
h=gcf;
more_times_simulation;
