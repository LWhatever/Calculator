%this application can draw functional image the user input
%it also can draw a fitting line according to the co-ordinate data the user
%input.
%Anthor:LWhatever_WHU


function varargout = draw_sim(varargin)
% DRAW_SIM MATLAB code for draw_sim.fig
%      DRAW_SIM, by itself, creates a new DRAW_SIM or raises the existing
%      singleton*.
%
%      H = DRAW_SIM returns the handle to a new DRAW_SIM or the handle to
%      the existing singleton*.
%
%      DRAW_SIM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DRAW_SIM.M with the given input arguments.
%
%      DRAW_SIM('Property','Value',...) creates a new DRAW_SIM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before draw_sim_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to draw_sim_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help draw_sim

% Last Modified by GUIDE v2.5 14-Aug-2016 12:12:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @draw_sim_OpeningFcn, ...
                   'gui_OutputFcn',  @draw_sim_OutputFcn, ...
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


% --- Executes just before draw_sim is made visible.
function draw_sim_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to draw_sim (see VARARGIN)
global count str;
str=cell(1);                                                                                                                %store the function expression in a cell
count=1;                                                                                                                   %count the function inputed
set(handles.radiobutton_hold,'Enable','off');                                                         %when draw for the first time,disable the hold on button
% Choose default command line output for draw_sim
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes draw_sim wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = draw_sim_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit_f_Callback(hObject, eventdata, handles)
% hObject    handle to edit_f (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_f as text
%        str2double(get(hObject,'String')) returns contents of edit_f as a double


% --- Executes during object creation, after setting all properties.
function edit_f_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_f (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_min_Callback(hObject, eventdata, handles)
% hObject    handle to edit_min (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_min as text
%        str2double(get(hObject,'String')) returns contents of edit_min as a double


% --- Executes during object creation, after setting all properties.
function edit_min_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_min (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_max_Callback(hObject, eventdata, handles)
% hObject    handle to edit_max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_max as text
%        str2double(get(hObject,'String')) returns contents of edit_max as a double


% --- Executes during object creation, after setting all properties.
function edit_max_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_draw.
function pushbutton_draw_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_draw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global h count str hs;
set(handles.radiobutton_hold,'Enable','on');                                                      %enable the hold on button
if get(handles.radiobutton_hold,'Value')==1                                                      %get the state of hold on button
    count=count+1;
    hold on;
else
    hold off;
    count=1;
end

f=get(handles.edit_f,'string');                                                                             %get the function expression
if f~=' '
    x_min=str2num(get(handles.edit_min,'string'));                                           %get the definition domain of function
    x_max=str2num(get(handles.edit_max,'string'));
    axes(handles.axes1);
    h=ezplot(f,[x_min,x_max]);                                                                            %get the handle of plot for more operations
    str{count}=f;                                                                                                    %store the function expression
    hs=legend(str);
end

y=str2num(get(handles.edit_y,'string'));                                                           %get the longitudinal ordinate
x=str2num(get(handles.edit_x,'string'));                                                           %get the horizontal ordinate
if y~=' '
    set(handles.radiobutton_hold,'Enable','off'); 
    set(handles.edit_f,'string','');                                                                         %clear the functional image window
    set(handles.edit_min,'string','');
    set(handles.edit_max,'string','');
    set(handles.radiobutton_hold,'Value',0);
    hold off;
    
    Y=interp1(x,y,(min(x):max(x)),'cubic');                                                          %creat a fitting line
    axes(handles.axes1);
    h=plot((min(x):max(x)),Y);                                                                              %get the handle of plot for more operations
end

if strcmp(get(handles.uitoggletool_grid,'State'),'off')                                      %control the grid
    grid off;
else
    grid on;
end


% --- Executes on button press in pushbutton_clear.
function pushbutton_clear_Callback(hObject, eventdata, handles)               %clear all windows
% hObject    handle to pushbutton_clear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global count hs;
count=1;
set(handles.radiobutton_hold,'Enable','off');
cla(handles.axes1);
delete(hs);
delete(get(gca,'title'));
set(handles.edit_f,'string','');
set(handles.edit_min,'string','');
set(handles.edit_max,'string','');
set(handles.edit_y,'string','');
set(handles.edit_x,'string','');
set(handles.radiobutton_hold,'Value',0);

% --------------------------------------------------------------------
function Untitled_more_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_more (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_linestyle_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_linestyle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_color_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_color (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_blue_Callback(hObject, eventdata, handles)                             %change the color of line
% hObject    handle to Untitled_blue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global h;
set(h,'color',[0,0,1]);

% --------------------------------------------------------------------
function Untitled_red_Callback(hObject, eventdata, handles)                              %change the color of line
% hObject    handle to Untitled_red (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global h;
set(h,'color',[1,0,0]);

% --------------------------------------------------------------------
function Untitled_normal_Callback(hObject, eventdata, handles)                        %change the style of line
% hObject    handle to Untitled_normal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global h;
set(h,'LineStyle','-');

% --------------------------------------------------------------------
function Untitled_dotandline_Callback(hObject, eventdata, handles)                 %change the style of line
% hObject    handle to Untitled_dotandline (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global h;
set(h,'LineStyle','-.');

% --------------------------------------------------------------------
function Untitled_dot_Callback(hObject, eventdata, handles)                             %change the style of line
% hObject    handle to Untitled_dot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global h;
set(h,'LineStyle',':');

% --------------------------------------------------------------------
function Untitled_green_Callback(hObject, eventdata, handles)                       %change the color of line
% hObject    handle to Untitled_green (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global h;
set(h,'color',[0,1,0]);


% --------------------------------------------------------------------
function uitoggletool_grid_OffCallback(hObject, eventdata, handles)              %toolbar button up,grid off
% hObject    handle to uitoggletool_grid (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1);
grid off;


% --------------------------------------------------------------------
function uitoggletool_grid_OnCallback(hObject, eventdata, handles)               %toolbar button on,grid on
% hObject    handle to uitoggletool_grid (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1);
grid on;



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



function edit_x_Callback(hObject, eventdata, handles)
% hObject    handle to edit_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_x as text
%        str2double(get(hObject,'String')) returns contents of edit_x as a double


% --- Executes during object creation, after setting all properties.
function edit_x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radiobutton_hold.
function radiobutton_hold_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_hold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_hold
