%this application can solve several kinds of simultaneous equations,
%and it can solve quadratic equation at most.
%It can only solve definite equations.

function varargout = Solve_sim(varargin)
% SOLVE_SIM MATLAB code for Solve_sim.fig
%      SOLVE_SIM, by itself, creates a new SOLVE_SIM or raises the existing
%      singleton*.
%
%      H = SOLVE_SIM returns the handle to a new SOLVE_SIM or the handle to
%      the existing singleton*.
%
%      SOLVE_SIM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SOLVE_SIM.M with the given input arguments.
%
%      SOLVE_SIM('Property','Value',...) creates a new SOLVE_SIM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Solve_sim_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Solve_sim_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Solve_sim

% Last Modified by GUIDE v2.5 14-Aug-2016 15:57:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Solve_sim_OpeningFcn, ...
                   'gui_OutputFcn',  @Solve_sim_OutputFcn, ...
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


% --- Executes just before Solve_sim is made visible.
function Solve_sim_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Solve_sim (see VARARGIN)
global str1 str2 str3 str4;
str1='';str2='';str3='';str4='';                                               %str1,str2,str3,str4 are related to four simultaneous equations
% Choose default command line output for Solve_sim
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Solve_sim wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Solve_sim_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
hs=helpdlg({'Supporting Model£º';'a*x+b*y+c*z=0 & a*x^2+b*x+c=0,'},'tip');  %inform the user of the limitation
ht = findobj(hs, 'Type', 'text');
set(ht, 'FontSize', 10, 'Unit', 'normal');

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton_solve.
function pushbutton_solve_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_solve (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global str1 str2 str3 str4;
str1=get(handles.edit1,'string');                                               %get equation one
str2=get(handles.edit2,'string');                                               %get equation two
str3=get(handles.edit3,'string');                                               %get equation three
str4=get(handles.edit4,'string');                                               %get equation four
if str1==' '&str2==' '&str3==' '&str4==' '                                   %check if the equation is input
    msgbox('Please enter the data£¡','warning');
elseif str2==' '&str3==' '&str4==' '                                            %solve a equation
    [x]=solve(str1);
    if length(x)==2
        Str1=string_catch(x);                                                        %make the result into string
    elseif length(x)==1
        Str1=rats(double(x(1)));                                                    %change the decimals into fractions
    else
        msgbox('Out of ability now,wait for future version ^-^');  %if the equation can not be solved
        Str1='';
    end
    set(handles.edit_x,'string',Str1);
elseif str3==' '&str4==' '                                                            %solve two simultaneous equations which have two unknown
    [x,y]=solve(str1,str2);
    if length(x)==2
        Str1=string_catch(x);                                                        %make the result into string
    elseif length(x)==1
        Str1=rats(double(x(1)));                                                    %change the decimals into fractions
    else
        msgbox('Out of ability now,wait for future version ^-^');
        Str1='';
    end
    if length(y)==2
        Str2=string_catch(y);                                                        %make the result into string
    elseif length(y)==1
        Str2=rats(double(y(1)));                                                    %change the decimals into fractions
    else
        Str2='';
    end
    set(handles.edit_x,'string',Str1);
    set(handles.edit_y,'string',Str2);
elseif str4==' '                                                                            %solve two simultaneous equations which have three unknown
    [x,y,z]=solve(str1,str2,str3);
    if length(x)==2
        Str1=string_catch(x);                                                        %make the result into string
    elseif length(x)==1
        Str1=rats(double(x(1)));                                                    %change the decimals into fractions
    else
        msgbox('Out of ability now,wait for future version ^-^');
        Str1='';
    end
    if length(y)==2
        Str2=string_catch(y);                                                        %make the result into string
    elseif length(y)==1
        Str2=rats(double(y(1)));                                                    %change the decimals into fractions
    else
        Str2='';
    end
    if length(z)==2
        Str3=string_catch(z);                                                        %make the result into string
    elseif length(z)==1
        Str3=rats(double(z(1)));                                                    %change the decimals into fractions
    else
        Str3='';
    end
    set(handles.edit_x,'string',Str1);
    set(handles.edit_y,'string',Str2);
    set(handles.edit_z,'string',Str3);
else                                                                                            %solve two simultaneous equations which have four unknown
    [w,x,y,z]=solve(str1,str2,str3,str4);
    if length(x)==2
        Str1=string_catch(x);                                                        %make the result into string
    elseif length(x)==1
        Str1=rats(double(x(1)));                                                    %change the decimals into fractions
    else
        msgbox('Out of ability now,wait for future version ^-^');
        Str1='';
    end
    if length(y)==2
        Str2=string_catch(y);                                                        %make the result into string
    elseif length(y)==1
        Str2=rats(double(y(1)));                                                    %change the decimals into fractions
    else
        Str2='';
    end
    if length(z)==2
        Str3=string_catch(z);                                                        %make the result into string
    elseif length(z)==1
        Str3=rats(double(z(1)));                                                    %change the decimals into fractions
    else
        Str3='';
    end
    if length(w)==2
        Str4=string_catch(w);                                                        %make the result into string
    elseif length(w)==1
        Str4=rats(double(w(1)));                                                    %change the decimals into fractions
    else
        Str4='';
    end
    set(handles.edit_x,'string',Str1);
    set(handles.edit_y,'string',Str2);
    set(handles.edit_z,'string',Str3);
    set(handles.edit_w,'string',Str4);
end

% --- Executes on button press in pushbutton_clear.
function pushbutton_clear_Callback(hObject, eventdata, handles)              %clear the adit windows
% hObject    handle to pushbutton_clear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit_x,'string','');
set(handles.edit_y,'string','');
set(handles.edit_z,'string','');
set(handles.edit_w,'string','');
set(handles.edit1,'string',' ');
set(handles.edit2,'string',' ');
set(handles.edit3,'string',' ');
set(handles.edit4,'string',' ');


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



function edit_z_Callback(hObject, eventdata, handles)
% hObject    handle to edit_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_z as text
%        str2double(get(hObject,'String')) returns contents of edit_z as a double


% --- Executes during object creation, after setting all properties.
function edit_z_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_w_Callback(hObject, eventdata, handles)
% hObject    handle to edit_w (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_w as text
%        str2double(get(hObject,'String')) returns contents of edit_w as a double


% --- Executes during object creation, after setting all properties.
function edit_w_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_w (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double

% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
