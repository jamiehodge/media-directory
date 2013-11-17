require "./lib/media/directory"

Media::Directory::Controllers::Base.children.each do |child|
  map "/%s" % child.namespace do
    run child
  end
end
