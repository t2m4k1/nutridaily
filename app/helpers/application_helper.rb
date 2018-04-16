module ApplicationHelper
    def current_class?(test_path)
        unless test_path.instance_of? String
            test_path = url_for(test_path);
        end
        if request.path == test_path
            'active'
        else
            ''
        end
    end
end
