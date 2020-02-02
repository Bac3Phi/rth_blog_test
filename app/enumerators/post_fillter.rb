# frozen_string_literal: true

class PostFillter < Inum::Base
  define :CREATED_AT_DESC, 1
  define :CREATED_AT_ASC, 2
  define :UPDATED_AT_DESC, 3
  define :UPDATED_AT_ASC, 4
end
