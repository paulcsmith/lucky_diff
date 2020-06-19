abstract class MainLayout
  include Lucky::HTMLPage

  abstract def content
  abstract def page_title

  # The default page title. It is passed to `Shared::LayoutHead`.
  #
  # Add a `page_title` method to pages to override it. You can also remove
  # This method so every page is required to have its own page title.
  def page_title
    "LuckyDiff"
  end

  def render
    html_doctype

    html lang: "en" do
      mount Shared::LayoutHead.new(page_title: page_title, context: context)

      body do
        mount Shared::Navbar.new
        mount Shared::FlashMessages.new(context.flash)
        div class: "p-10" do
          content
        end
      end
    end
  end
end
