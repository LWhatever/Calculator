%this application can solve first-order and second-order
%differential equations.

function varargout = DSolve(varargin)
% DSOLVE MATLAB code for DSolve.fig
%      DSOLVE, by itself, creates a new DSOLVE or raises the existing
%      singleton*.
%
%      H = DSOLVE returns the handle to a new DSOLVE or the handle to
%      the existing singleton*.
%
%      DSOLVE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DSOLVE.M with the given input arguments.
%
%      DSOLVE('Property','Value',...) creates a new DSOLVE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DSolve_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DSolve_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DSolve

% Last Modified by GUIDE v2.5 17-Aug-2016 17:31:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DSolve_OpeningFcn, ...
                   'gui_OutputFcn',  @DSolve_OutputFcn, ...
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


% --- Executes just before DSolve is made visible.
function DSolve_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DSolve (see VARARGIN)
global Dy;                                                                                  %related to the differential equation
global y0;                                                                                   %related to the initial value of the origional equation
global mid;                                                                                 %related to the intermediate variable
global Dy0;                                                                                %related to the initial value of the first-order derivative
global y;                                                                                     %related to the origional equation
% Choose default command line output for DSolve
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes DSolve wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = DSolve_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton_ans.
function pushbutton_ans_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_ans (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Dy y0 mid Dy0 y;
Dy=get(handles.edit_D,'string');                                                                    %get the differential equation
y0=get(handles.edit_y0,'string');                                                                   %get the initial value of the origional equation
mid=get(handles.edit_middle,'string');                                                          %get the intermediate variable
Dy0=get(handles.edit_Dy0,'string');                                                              %get the initial value of the first-order derivative
if isempty(Dy)&isempty(y0)&isempty(mid)&isempty(Dy0)                          %check the data
    msgbox('Please enter the data£¡','warning');
    return;
elseif isempty(y0)&isempty(mid)&isempty(Dy0)                                          %dsolve(Dy) or dsolve(D2y)
    y=char(simplify(dsolve(Dy)));
elseif isempty(y0)&isempty(Dy0)                                                                  %dsolve(Dy,mid) or dsolve(D2y,mid)
     y=char(simplify(dsolve(Dy,mid)));
elseif isempty(y0)&isempty(mid)                                                                   %dsolve(D2y,Dy0)
    y=char(simplify(dsolve(Dy,Dy0)));
elseif isempty(Dy0)&isempty(mid)                                                                %dsolve(Dy,y0)
    y=char(simplify(dsolve(Dy,y0)));
elseif isempty(y0)                                                                                           %dsolve(D2y,Dy0,mid)
    y=char(simplify(dsolve(Dy,Dy0,mid)));
elseif isempty(Dy0)                                                                                        %dsolve(Dy,y0,mid)
    y=char(simplify(dsolve(Dy,y0,mid)));
elseif isempty(mid)                                                                                         %dsolve(D2y,y0,Dy0)
    y=char(simplify(dsolve(Dy,y0,Dy0)));
else                                                                                                                  %dsolve(D2y,y0,Dy0,mid)
    y=char(simplify(dsolve(Dy,y0,Dy0,mid)));
end
if strcmp(y,'matrix([])')                                                                                     %occurs conflics or error input
    msgbox('There are erros when entering the data£¬pleas check£¡','warning');
else
    set(handles.edit_y,'string',y);                                                                     %show the answer
end

% --- Executes on button press in pushbutton_clear.
function pushbutton_clear_Callback(hObject, eventdata, handles)             %clear windows
% hObject    handle to pushbutton_clear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit_D,'string','');
set(handles.edit_y0,'string','');
set(handles.edit_middle,'string','');
set(handles.edit_Dy0,'string','');
set(handles.edit_y,'string','');


function edit_y_Callback(hObject, eventdata, handles)
% hObject    handle to edit_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_y as text
%        str2double(get(hObject,'String')) returns contents of edit_y as a double


% --- Executes during object creation, after setting all properties.
function edit_y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_D_Callback(hObject, eventdata, handles)
% hObject    handle to edit_D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_D as text
%        str2double(get(hObject,'String')) returns contents of edit_D as a double


% --- Executes during object creation, after setting all properties.
function edit_D_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_middle_Callback(hObject, eventdata, handles)
% hObject    handle to edit_middle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_middle as text
%        str2double(get(hObject,'String')) returns contents of edit_middle as a double


% --- Executes during object creation, after setting all properties.
function edit_middle_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_middle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_y0_Callback(hObject, eventdata, handles)
% hObject    handle to edit_y0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_y0 as text
%        str2double(get(hObject,'String')) returns contents of edit_y0 as a double


% --- Executes during object creation, after setting all properties.
function edit_y0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_y0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_Dy0_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Dy0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_Dy0 as text
%        str2double(get(hObject,'String')) returns contents of edit_Dy0 as a double


% --- Executes during object creation, after setting all properties.
function edit_Dy0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Dy0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
