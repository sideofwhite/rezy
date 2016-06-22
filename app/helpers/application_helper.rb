module ApplicationHelper
def is_active?(link_path)
 current_page?(link_path) ? "nav-list-item active" : "nav-list-item"
end

def header_is_active?(link_path)
 current_page?(link_path) ? "header-box active" : "header-box"
end

def property_is_active?(link_path)
 current_page?(link_path) ? "properties-container active" : "properties-container"
end


end
