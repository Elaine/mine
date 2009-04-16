# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def delete_comment_path(options)
    comment_path(:id => options[:id], :backurl => request.url)
  end
  def will_paginate_remote(paginator, options={})
    update = options.delete(:update)
    url = options.delete(:url)
    str = will_paginate(paginator, options)
    if str != nil
      str.gsub(/href="(.*?)"/) do
        "href=\"#\" onclick=\"new Ajax.Updater('" + update + "', '" + (url ? url + $1.sub(/[^\?]*/, '') : $1) +
          "', {asynchronous:true, evalScripts:true, method:'get',}); return false;\""
      end
    end
  end

  def tag_cloud(tags, classes)
    max_count = tags.sort_by(&:count).last.count.to_f
    tags.each do |tag|
      index = ((tag.count / max_count) * (classes.size - 1)).round
      yield tag, classes[index]
    end
  end

  def minifeed_message(activity)
    user = activity.user
    case activity_type(activity)
    when "Entry"
      entry = activity.item
      %(#{ link_to user.login_name,user_path(user) } 发表了一篇新文章在
        #{ link_to entry.title,user_entry_path(user, entry)})
    when "Comment"
      parent = activity.item.commentable
      parent_type = parent.class.to_s
      case parent_type
      when "Entry"
        comment = activity.item.commentable
        entry = comment.entry
        %(#{link_to user.login_name, user_path(user)} 发表了一个新评论在
          #{link_to entry.title, user_entry_comments_path(user, entry)})
      when "Photo"
        photo = activity.item.commentable
        %(#{link_to user.login_name, user_path(activity.item.commenter)} 发表评论在 
          #{link_to photo.title, user_album_photo_path(photo, photo.album,activity.item.commenter)})
      end
    when "Photo"
      photo = activity.item
      %(#{link_to user.login_name,user_path(user)} 上传了一张新图片在 #{link_to photo.title, user_album_photo_path(user, photo.album, photo)} )
    end
  end

  private
  def activity_type(activity)
    activity.item.class.to_s
  end
end
