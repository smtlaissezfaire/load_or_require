module Kernel
  def load_or_require(file)
    Rails.configuration.cache_classes ? require(file) : load(file)
  end
end
