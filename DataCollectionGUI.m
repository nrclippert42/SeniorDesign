function varargout = DataCollectionGUI(varargin)
% DATACOLLECTIONGUI MATLAB code for DataCollectionGUI.fig
%
%   http://www.mathworks.com/help/matlab/creating_guis/add-code-for-components-in-callbacks.html
%
% Last Modified by GUIDE v2.5 29-Apr-2015 11:40:06
%
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DataCollectionGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @DataCollectionGUI_OutputFcn, ...
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


% --- Executes just before DataCollectionGUI is made visible.
function DataCollectionGUI_OpeningFcn(hObject, ~, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DataCollectionGUI (see VARARGIN)

% Choose default command line output for DataCollectionGUI
handles.output = hObject;

out = instrhwinfo('serial');
if ~isempty(out.AvailableSerialPorts);
    for i = length(out.AvailableSerialPorts)
        set(handles.CommPorts, 'String', out.AvailableSerialPorts{i});
    end
end

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes DataCollectionGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = DataCollectionGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in GetData.
function GetData_Callback(hObject, eventdata, handles)
% hObject    handle to GetData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in StopDataCollection.
function StopDataCollection_Callback(hObject, eventdata, handles)
% hObject    handle to StopDataCollection (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in SaveData.
function SaveData_Callback(hObject, eventdata, handles)
% hObject    handle to SaveData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in CommPorts.
function CommPorts_Callback(hObject, eventdata, handles)
% hObject    handle to CommPorts (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns CommPorts contents as cell array
%        contents{get(hObject,'Value')} returns selected item from CommPorts


% --- Executes during object creation, after setting all properties.
function CommPorts_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CommPorts (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in ConnectToPort.
function ConnectToPort_Callback(hObject, ~, handles)
% hObject    handle to ConnectToPort (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% get the currently selected port from the pop up list
contents = cellstr(get(handles.CommPorts,'String'));
CurrentValue = contents{get(handles.CommPorts,'Value')};

if ~strcmp(CurrentValue, 'No Connections Available')
    % create the serial port
    Port = serial(CurrentValue, 'Timeout', 1, 'Baudrate', 9600);
    try
        % opent the port and save it in the 
        fopen(Port);
        handles.Port = Port;
        % turn the connect button off
        set(handles.ConnectToPort, 'Enable', 'Off');
    catch e
        disp(e.message);
    end
end

% update gui data
guidata(hObject, handles);


% --- Executes on button press in ClearCommPort.
function ClearCommPort_Callback(hObject, ~, handles)
% hObject    handle to ClearCommPort (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Refresh.
function Refresh_Callback(hObject, ~, handles)
% hObject    handle to Refresh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
