%this is an caculator application imitating the iPhone's,but it is stronger
%because it has more function like solving equations,drawing functional
%image,fitting image,ect.

function varargout = caculator_sim(varargin)
% CACULATOR_SIM MATLAB code for caculator_sim.fig
%      CACULATOR_SIM, by itself, creates a new CACULATOR_SIM or raises the existing
%      singleton*.
%
%      H = CACULATOR_SIM returns the handle to a new CACULATOR_SIM or the handle to
%      the existing singleton*.
%
%      CACULATOR_SIM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CACULATOR_SIM.M with the given input arguments.
%
%      CACULATOR_SIM('Property','Value',...) creates a new CACULATOR_SIM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before caculator_sim_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to caculator_sim_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help caculator_sim

% Last Modified by GUIDE v2.5 09-Aug-2016 20:31:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @caculator_sim_OpeningFcn, ...
                   'gui_OutputFcn',  @caculator_sim_OutputFcn, ...
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


% --- Executes just before caculator_sim is made visible.
function caculator_sim_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to caculator_sim (see VARARGIN)
global str1 str2 ans_state mode_x1 mode_x2 change_x1 change_x2 a ansr;
                                                                                                                 %x1--the number being adit is on the left of the operator
                                                                                                                 %x2--the number being adit is on the right of the operator
str1=' ';                                                                                                     %the string in the caculating window 
str2='';                                                                                                      %the string in the answer window
ans_state=0;                                                                                           %if the answer is made,ans_state=1
mode_x1=1;                                                                                            %if the number being adit is x1,mode_x1=1,mode_x2=0;
mode_x2=0;                                                                                            %else mode_x1=0,mode_x2=1
change_x1=1;                                                                                         %when press the +/- button and the number being adit is x1,
                                                                                                                 %x1=-x1,and change_x1=-change_x1
                                                                                                                 %x1>0,change_x1=1
change_x2=1;                                                                                         %when press the +/- button and the number being adit is x2,
                                                                                                                 %x2=-x2,and change_x2=-change_x2
                                                                                                                 %x2>0,change_x2=1
ansr=0;                                                                                                     %answer number
a=0;                                                                                                          %when using an operator in caculating window,remember the 
                                                                                                                 %end place,this is useful in the +/- callback function
% Choose default command line output for caculator_sim
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes caculator_sim wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = caculator_sim_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton_AC.
function pushbutton_AC_Callback(hObject, eventdata, handles)     %initialize the caculator
% hObject    handle to pushbutton_AC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global str1 str2 mode_x1 mode_x2 change_x1 change_x2 ans_state;
str1=' ';                                                                                                   %reserve a space for the char '-'
str2='';                                                                                                    %set the answer window empty
change_x1=1;                                                                                       %x1>0,change_x1=1
change_x2=1;                                                                                       %x2>0,change_x2=1
mode_x1=1;                                                                                          %the number being adit is x1,mode_x1=1,mode_x2=0
mode_x2=0;
ans_state=0;                                                                                         %no answer,ans_state=0
set(handles.edit1,'string',str1);                                                            %clear the two windows
set(handles.edit2,'string',str2);

% --- Executes on button press in pushbutton_change.
function pushbutton_change_Callback(hObject, eventdata, handles)%change the plus-minus state
% hObject    handle to pushbutton_change (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global str1 str2 ansr change_x1 change_x2 mode_x1 mode_x2 ans_state a;
if ~ans_state                                                                               %change the plus-minus state of x1 or x2
    if mode_x1                                                                              %change the plus-minus state of x1
        change_x1=-change_x1;
        if change_x1<0
            str1(1)='-';                                                                        %x1<0
        else
            str1(1)=' ';                                                                        %x1>0
        end
    elseif mode_x2                                                                      %change the plus-minus state of x2
            change_x2=-change_x2;
            if change_x2<0
                str1(a+1)='-';                                                               %x2<0
            else
                str1(a+1)=' ';                                                               %x2>0
            end
      end
end
if ans_state                                                                                %change the plus-minus state of the answer
    if ansr>0
        str1='';
        change_x1=-1;                                                                  %the answer will move to the caculating window,x1=-ansr
    else
        str1=' ';
        change_x1=1;                                                                   %the answer will move to the caculating window,x1=-ansr
    end
    str1=sprintf('%s%d',str1,-ansr);                                           %move the ansr to caculating window
    ans_state=0;                                                                         %initialize the answer window
    mode_x1=1;                                                                         %initialize the caculating window
    mode_x2=0;
    str2='';
end
set(handles.edit1,'string',str1);                                                %refresh the two windows
set(handles.edit2,'string',str2);

% --- Executes on button press in pushbutton_divide.
function pushbutton_divide_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_divide (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global str1 mode_x1 mode_x2 a ans_state str2;
if ~ans_state                                                                             %operate the caculating window
    mode_x1=0;mode_x2=1;                                                    %start to operating x2
    str1=sprintf('%s%s',str1,'/');
elseif ans_state                                                                        %operate the answer
    str1=str2;                                                                               %move the ansr to caculating window
    str1=sprintf('%s%s',str1,'/');
    str2='';set(handles.edit2,'string',str2);                                 %clear the answer window
    ans_state=0;
end
a=length(str1);                                                                           %remember the end place of operator,used in the +/- callback function
str1(a+1)=' ';                                                                              %reserve a space for the char '-'
set(handles.edit1,'string',str1);

% --- Executes on button press in pushbutton_percent.
function pushbutton_percent_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_percent (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global str1 mode_x1 mode_x2 a ans_state str2;
if ~ans_state                                                                             %operate the caculating window
    mode_x1=0;mode_x2=1;                                                    %start to operating x2
    str1=sprintf('%s%s',str1,'/100');
elseif ans_state                                                                        %operate the answer
    str1=str2;                                                                               %move the ansr to caculating window
    str1=sprintf('%s%s',str1,'/100');
    str2='';set(handles.edit2,'string',str2);                                 %clear the answer window
    ans_state=0;
end
a=length(str1);                                                                           %remember the end place of operator,used in the +/- callback function
str1(a+1)=' ';                                                                              %reserve a space for the char '-'
set(handles.edit1,'string',str1);

% --- Executes on button press in pushbutton_multiply.
function pushbutton_multiply_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_multiply (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global str1 mode_x1 mode_x2 a ans_state str2;
if ~ans_state                                                                             %operate the caculating window
    mode_x1=0;mode_x2=1;                                                    %start to operating x2
    str1=sprintf('%s%s',str1,'*');
elseif ans_state                                                                        %operate the answer
    str1=str2;                                                                               %move the ansr to caculating window
    str1=sprintf('%s%s',str1,'*');
    str2='';set(handles.edit2,'string',str2);                                 %clear the answer window
    ans_state=0;
end
a=length(str1);                                                                           %remember the end place of operator,used in the +/- callback function
str1(a+1)=' ';                                                                              %reserve a space for the char '-'
set(handles.edit1,'string',str1);

% --- Executes on button press in pushbutton_7.
function pushbutton_7_Callback(hObject, eventdata, handles)             %add a number to the caculating window
% hObject    handle to pushbutton_7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global str1 str2 ans_state;
if ans_state                                                                                                %if the answer is made,clear it
    str1=' ';
    ans_state=0;
    str2='';
    set(handles.edit2,'string',str2);
end
str1=sprintf('%s%d',str1,7);
set(handles.edit1,'string',str1);

% --- Executes on button press in pushbutton_8.
function pushbutton_8_Callback(hObject, eventdata, handles)             %add a number to the caculating window
% hObject    handle to pushbutton_8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global str1 str2 ans_state;
if ans_state                                                                                                %if the answer is made,clear it
    str1=' ';
    ans_state=0;
    str2='';
    set(handles.edit2,'string',str2);
end
str1=sprintf('%s%d',str1,8);
set(handles.edit1,'string',str1);

% --- Executes on button press in pushbutton_9.
function pushbutton_9_Callback(hObject, eventdata, handles)             %add a number to the caculating window
% hObject    handle to pushbutton_9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global str1 str2 ans_state;
if ans_state                                                                                                %if the answer is made,clear it
    str1=' ';
    ans_state=0;
    str2='';
    set(handles.edit2,'string',str2);
end
str1=sprintf('%s%d',str1,9);
set(handles.edit1,'string',str1);

% --- Executes on button press in pushbutton_6.
function pushbutton_6_Callback(hObject, eventdata, handles)             %add a number to the caculating window
% hObject    handle to pushbutton_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global str1 str2 ans_state;
if ans_state                                                                                                %if the answer is made,clear it
    str1=' ';
    ans_state=0;
    str2='';
    set(handles.edit2,'string',str2);
end
str1=sprintf('%s%d',str1,6);
set(handles.edit1,'string',str1);

% --- Executes on button press in pushbutton_5.
function pushbutton_5_Callback(hObject, eventdata, handles)             %add a number to the caculating window
% hObject    handle to pushbutton_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global str1 str2 ans_state;
if ans_state                                                                                                %if the answer is made,clear it
    str1=' ';
    ans_state=0;
    str2='';
    set(handles.edit2,'string',str2);
end
str1=sprintf('%s%d',str1,5);
set(handles.edit1,'string',str1);

% --- Executes on button press in pushbutton_4.
function pushbutton_4_Callback(hObject, eventdata, handles)             %add a number to the caculating window
% hObject    handle to pushbutton_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global str1 str2 ans_state;
if ans_state                                                                                                %if the answer is made,clear it
    str1=' ';
    ans_state=0;
    str2='';
    set(handles.edit2,'string',str2);
end
str1=sprintf('%s%d',str1,4);
set(handles.edit1,'string',str1);

% --- Executes on button press in pushbutton_minus.
function pushbutton_minus_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_minus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global str1 mode_x1 mode_x2 a ans_state str2;
if ~ans_state                                                                             %operate the caculating window
    mode_x1=0;mode_x2=1;                                                    %start to operating x2
    str1=sprintf('%s%s',str1,'-');
elseif ans_state                                                                        %operate the answer
    str1=str2;                                                                               %move the ansr to caculating window
    str1=sprintf('%s%s',str1,'-');
    str2='';set(handles.edit2,'string',str2);                                 %clear the answer window
    ans_state=0;
end
a=length(str1);                                                                           %remember the end place of operator,used in the +/- callback function
str1(a+1)=' ';                                                                              %reserve a space for the char '-'
set(handles.edit1,'string',str1);

% --- Executes on button press in pushbutton_3.
function pushbutton_3_Callback(hObject, eventdata, handles)             %add a number to the caculating window
% hObject    handle to pushbutton_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global str1 str2 ans_state;
if ans_state                                                                                                %if the answer is made,clear it
    str1=' ';
    ans_state=0;
    str2='';
    set(handles.edit2,'string',str2);
end
str1=sprintf('%s%d',str1,3);
set(handles.edit1,'string',str1);

% --- Executes on button press in pushbutton_2.
function pushbutton_2_Callback(hObject, eventdata, handles)             %add a number to the caculating window
% hObject    handle to pushbutton_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global str1 str2 ans_state;
if ans_state                                                                                                %if the answer is made,clear it
    str1=' ';
    ans_state=0;
    str2='';
    set(handles.edit2,'string',str2);
end
str1=sprintf('%s%d',str1,2);
set(handles.edit1,'string',str1);

% --- Executes on button press in pushbutton_1.
function pushbutton_1_Callback(hObject, eventdata, handles)             %add a number to the caculating window
% hObject    handle to pushbutton_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global str1 str2 ans_state;
if ans_state                                                                                                %if the answer is made,clear it
    str1=' ';
    ans_state=0;
    str2='';
    set(handles.edit2,'string',str2);
end
str1=sprintf('%s%d',str1,1);
set(handles.edit1,'string',str1);

% --- Executes on button press in pushbutton_plus.
function pushbutton_plus_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_plus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global str1 mode_x1 mode_x2 a ans_state str2;
if ~ans_state                                                                             %operate the caculating window
    mode_x1=0;mode_x2=1;                                                    %start to operating x2
    str1=sprintf('%s%s',str1,'+');
elseif ans_state                                                                        %operate the answer
    str1=str2;                                                                               %move the ansr to caculating window
    str1=sprintf('%s%s',str1,'+');
    str2='';set(handles.edit2,'string',str2);                                 %clear the answer window
    ans_state=0;
end
a=length(str1);                                                                           %remember the end place of operator,used in the +/- callback function
str1(a+1)=' ';                                                                              %reserve a space for the char '-'
set(handles.edit1,'string',str1);

% --- Executes on button press in pushbutton_0.
function pushbutton_0_Callback(hObject, eventdata, handles)             %add a number to the caculating window
% hObject    handle to pushbutton_0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global str1 str2 ans_state;
if length(str1)==2                                                                                      %can't treat '0' as the first number
    str1(2)='';
end
if ans_state                                                                                                %if the answer is made,clear it
    str1=' ';
    ans_state=0;
    str2='';
    set(handles.edit2,'string',str2);
end
str1=sprintf('%s%d',str1,0);
set(handles.edit1,'string',str1);

% --- Executes on button press in pushbutton_dot.
function pushbutton_dot_Callback(hObject, eventdata, handles)         %add a dot to the caculating window
% hObject    handle to pushbutton_dot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global str1 str2 ans_state;
if ans_state                                                                                                %if the answer is made,clear it
    str1=' ';
    ans_state=0;
    str2='';
    set(handles.edit2,'string',str2);
end
str1=sprintf('%s%s',str1,'.');
set(handles.edit1,'string',str1);


% --- Executes on button press in pushbutton_is.
function pushbutton_is_Callback(hObject, eventdata, handles)                    %get the answer
% hObject    handle to pushbutton_is (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ansr str2 str1 ans_state;
ansr=str2num(str1);
str2=num2str(ansr);
set(handles.edit2,'string',str2);
ans_state=1;

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


% --- Executes on button press in button_pro.
function button_pro_Callback(hObject, eventdata, handles)                     %more function
% hObject    handle to button_pro (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
m=menu('more function','Basic Draw','Advanced Draw','Solve Simultaneous Definite Equations','Solve Differential Equation');
if m==1
    run('draw_sim');                                                                %Basic Drew
elseif m==2
    funtool;                                                                              %Advanced Draw
elseif m==3
    run('Solve_sim');                                                               %Solve Simultaneous Equations
elseif m==4
    run('DSolve');                                                                    %Solve Differential Equation
end

% --- Executes on button press in button_back.
function button_back_Callback(hObject, eventdata, handles)                 %delete a char
% hObject    handle to button_back (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global str1 ans_state;
ans_state=0;
str1(length(str1))='';
set(handles.edit1,'string',str1);


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
