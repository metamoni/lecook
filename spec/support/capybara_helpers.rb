def find_trix_editor(id)
  find(:xpath, "//*[@id='#{id}']", visible: false)
end

def fill_in_trix_editor(id, with:)
  find_trix_editor(id).click.set(with)
end
