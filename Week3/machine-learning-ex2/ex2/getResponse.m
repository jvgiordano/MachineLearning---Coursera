% lib\submitWithConfiguration.m
function response = getResponse(url, body)
% try using urlread() and a secure connection
  params = {'jsonBody', body};
  
  % !!! the code run this line return 
  [response, success] = urlread(url, 'post', params);

  if (success == 0)
    % urlread didn't work, try curl & the peer certificate patch
    if ispc
      % testing note: use 'jsonBody =' for a test case
      json_command = sprintf('echo jsonBody=%s | curl -k -X POST -d @- %s', body, url);
    else
      % it's linux/OS X, so use the other form
      json_command = sprintf('echo ''jsonBody=%s'' | curl -k -X POST -d @- %s', body, url);
    end
    % get the response body for the peer certificate patch method
    [code, response] = system(json_command);
    
    % !!!try to replace response with json content
    response = response(strfind(response,'{'):end);
    
    % test the success code
    if (code ~= 0)
      fprintf('[error] submission with curl() was not successful\n');
    end
  end
end