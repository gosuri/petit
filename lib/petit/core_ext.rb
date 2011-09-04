class Hash
  def rename_key(old,new)
    self[new] = self.delete(old)
  end
end
