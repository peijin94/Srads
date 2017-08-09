% when zooming time axis, the user can use this function to update time
% axis

function update_x_date()
     datetick('x','HH:MM:SS','keeplimits')
end