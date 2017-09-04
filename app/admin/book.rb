ActiveAdmin.register Book do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  permit_params :title, :description, :year, :materials,
                :quantity, :price,
                :cover, pictures: [:url], dimensions: [:H, :W, :D]#, author_ids: true

  show do
    default_main_content do
      row 'Authors' do
        ul book.authors.map { |author| li link_to author.name.to_s, admin_author_path(author)}
      end
      row 'Pictures' do
        ul book.pictures.map { |picture| li link_to picture.url.to_s, admin_picture_path(picture)}
      end
    end
    # panel 'Pictures' do
    #   table_for book.pictures do
    #     column :id
    #     column :url do |picture|
    #       link_to picture.url.to_s, admin_picture_path(picture)
    #     end
    #   end
    # end
  end

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :title
      f.input :description
      f.input :year
      f.input :materials
      f.input :quantity
      f.input :price
      f.input :authors, as: :select, multiple: true
      f.input :cover, hint: image_tag(f.object.cover.url(:small) || '')
    end

    f.inputs name: 'Dimensions', for: :dimensions do |dimension|
      f.semantic_errors :dimensions_eror
      dimension.input :H, input_html: { value: "#{book.dimensions['H']}" }
      dimension.input :W, input_html: { value: "#{book.dimensions['W']}" }
      dimension.input :D, input_html: { value: "#{book.dimensions['D']}" }
    end
    f.actions
  end
end
