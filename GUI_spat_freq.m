function varargout = GUI_spat_freq(varargin)
% GUI_SPAT_FREQ MATLAB code for GUI_spat_freq.fig
%      GUI_SPAT_FREQ, by itself, creates a new GUI_SPAT_FREQ or raises the existing
%      singleton*.
%
%      H = GUI_SPAT_FREQ returns the handle to a new GUI_SPAT_FREQ or the handle to
%      the existing singleton*.
%
%      GUI_SPAT_FREQ('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_SPAT_FREQ.M with the given input arguments.
%
%      GUI_SPAT_FREQ('Property','Value',...) creates a new GUI_SPAT_FREQ or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_spat_freq_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_spat_freq_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_spat_freq

% Last Modified by GUIDE v2.5 20-Dec-2013 11:10:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_spat_freq_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_spat_freq_OutputFcn, ...
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


% --- Executes just before GUI_spat_freq is made visible.
function GUI_spat_freq_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_spat_freq (see VARARGIN)


handles.real = 0;
handles.imag = 0;
handles.X = 0;
handles.Y = 0;



% Choose default command line output for GUI_spat_freq
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_spat_freq wait for user response (see UIRESUME)
% uiwait(handles.figure1);

spat_freq(hObject, eventdata, handles)


% --- Outputs from this function are returned to the command line.
function varargout = GUI_spat_freq_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider_disp_Y_Callback(hObject, eventdata, handles)
% hObject    handle to slider_disp_Y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.Y = round(get(hObject,'Value'));
set(handles.text_Y, 'string', handles.Y);

% Update Handles when writing to handles 
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);

spat_freq(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function slider_disp_Y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_disp_Y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider_disp_X_Callback(hObject, eventdata, handles)
% hObject    handle to slider_disp_X (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.X = round(get(hObject,'Value'));
set(handles.text_X, 'string', handles.X);

% Update Handles when writing to handles 
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);

spat_freq(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function slider_disp_X_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_disp_X (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider_value_b_imag_Callback(hObject, eventdata, handles)
% hObject    handle to slider_value_b_imag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.imag = round(get(hObject,'Value'));
set(handles.text_imag, 'string', handles.imag/100);

% Update Handles when writing to handles 
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);

spat_freq(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function slider_value_b_imag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_value_b_imag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider_value_a_real_Callback(hObject, eventdata, handles)
% hObject    handle to slider_value_a_real (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

handles.real = round(get(hObject,'Value'));
set(handles.text_real, 'string', handles.real/100);

% Update Handles when writing to handles 
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);

spat_freq(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function slider_value_a_real_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_value_a_real (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in checkbox_symmetry.
function checkbox_symmetry_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_symmetry (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Update Handles when writing to handles 
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);

spat_freq(hObject, eventdata, handles)
% Hint: get(hObject,'Value') returns toggle state of checkbox_symmetry
