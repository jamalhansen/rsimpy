require 'base_service'

module RSimpy
  MERGE_TAGS = 'MergeTags'
  SPLIT_TAG = 'SplitTag'
  RENAME_TAG = "RenameTag"
  REMOVE_TAG = 'RemoveTag'
  DELETE_LINK = 'DeleteLink'
  SAVE_LINK = 'SaveLink'
  DELETE_NOTE = 'DeleteNote'
  SAVE_NOTE = 'SaveNote'

  class PostingService < RSimpy::BaseService
    def initialize command, client
      @command = command
      @client = client
    end

    def execute params
      execute_using :post, params
    end

    def build_link params
      "/#{@command}.do?" << params.to_querystring
    end
  end
end
