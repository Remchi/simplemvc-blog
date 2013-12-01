require 'sqlite3'

class PostMapper

  @@db = SQLite3::Database.new File.join "db", "app.db"

  def save(post)
    if post.id
      @@db.execute(<<SQL, [post.title, post.body, post.created_at, post.id])
UPDATE posts
SET
header = ?, content = ?, created_at = ?
WHERE id = ?
SQL
    else
      @@db.execute "INSERT INTO posts (header, content, created_at) VALUES (?,?,?)", [post.title, post.body, post.created_at.to_s]
    end
  end

  def self.find(id)
    row = @@db.execute("SELECT id, header, content, created_at FROM posts WHERE id=?", id).first
    post = Post.new
    post.id = row[0]
    post.title = row[1]
    post.body = row[2]
    post.created_at = row[3]
    post
  end

  def self.findAll
    data = @@db.execute "SELECT id, header, content, created_at FROM posts"
    data.map do |row|
      post = Post.new
      post.id = row[0]
      post.title = row[1]
      post.body = row[2]
      post.created_at = row[3]
      post
    end
  end

  def delete(id)
    @@db.execute "DELETE FROM posts WHERE id = ?", id
  end

end
