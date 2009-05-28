module Responsive

  def get_response
    '<?xml version="1.0" encoding="UTF-8"?>

<links>
  <link accessType="public">
    <url>http://www.foobar.com</url>
    <modDate>2005-03-15</modDate>
    <addDate>2005-03-15</addDate>
    <title>FooBar</title>
    <nickname>Foo Bar Site</nickname>
    <tags>
      <tag>tag1</tag>
      <tag>tag2</tag>
    </tags>
    <note>note here</note>
  </link>
  <link accessType="private">
    <url>
      http://www.ontopia.net/topicmaps/materials/tm-vs-thesauri.html
    </url>
    <modDate>2005-03-15</modDate>
    <addDate>2005-03-15</addDate>
    <title>Metadata? Thesauri? Taxonomies? Topic Maps!</title>
    <nickname/>
    <tags>
      <tag>topics</tag>
      <tag>tags</tag>
      <tag>taxonomies</tag>
    </tags>
    <note/>
  </link>
</links>'
  end

  def post_response
    '<?xml version="1.0" encoding="UTF-8"?>

<status>
  <code>0</code>
  <message>Link saved successfully.</message>
</status>'
  end

  def delete_response
    '<?xml version="1.0" encoding="UTF-8"?>

<status>
  <code>0</code>
  <message>Link deleted successfully.</message>
</status>'
  end

  def tag_splitting_response
    '<?xml version="1.0" encoding="UTF-8"?>

<status>
  <code>0</code>
  <message>Tag split successfully.</message>
</status>'
  end

  def tag_merging_response
    '<?xml version="1.0" encoding="UTF-8"?>

<status>
  <code>0</code>
  <message>Tags merged successfully.</message>
</status>'
  end

  def tag_renaming_response
    '<?xml version="1.0" encoding="UTF-8"?>

<status>
  <code>0</code>
  <message>Tag renamed successfully.</message>
</status>'
  end

  def tag_removing_response
    '<?xml version="1.0" encoding="UTF-8"?>

<status>
  <code>0</code>
  <message>Tag removed successfully.</message>
</status>'
  end

  def tag_querying_response
    '<?xml version="1.0" encoding="UTF-8"?>

<tags user="user1">
  <tag name="tags" count="22"/>
  <tag name="folksonomy" count="15"/>
  <tag name="taxonomies" count="10"/>
  <tag name="labels" count="7"/>
  <tag name="tag1" count="5"/>
  <tag name="tag2" count="3"/>
  <tag name="topics" count="2"/>
</tags>'
  end

  def note_removing_response
    '<?xml version="1.0" encoding="UTF-8"?>

<status>
  <code>0</code>
  <message>Note deleted successfully.</message>
</status>'
  end

  def note_saving_response
    '<?xml version="1.0" encoding="UTF-8"?>

<status>
  <code>0</code>
  <message>Note saved successfully.</message>
</status>'
  end

  def note_querying_response
    '<?xml version="1.0" encoding="UTF-8"?>

<notes>
  <note accessType="private">
    <uri>http://www.simpy.com/simpy/NoteDetails.do?noteId=666</uri>
    <id>666</id>
    <modDate>date here</modDate>
    <addDate>date here</addDate>
    <title>title here</title>
    <tags>
      <tag>goober</tag>
      <tag>New York</tag>
    </tags>
    <description>I like ice-cream</description>
  </note>

  <note accessType="private">
    <uri>http://www.simpy.com/simpy/NoteDetails.do?noteId=314159265</uri>
    <modDate>date here</modDate>
    <addDate>date here</addDate>
    <title>title here</title>
    <nickname>nickname here</nickname>
    <tags>
      <tag>goober</tag>
      <tag>New York</tag>
    </tags>
    <description>tea with cookies... mmmm</description>
  </note>
</notes>'
  end
end