# frozen_string_literal: true

# Code comments must not use em dashes.
ActiveAdmin.register Customer do
  permit_params :full_name, :phone_number, :email_address, :notes, :image

  index do
    selectable_column
    id_column
    column :full_name
    column :phone_number
    column :email_address
    column :created_at
    column :image do |customer|
      if customer.image.attached?
        image_tag url_for(customer.image), style: "height:36px; width:36px; object-fit:cover; border-radius:6px;"
      end
    end
    actions
  end

  form do |f|
    f.inputs "Customer Details" do
      f.input :full_name
      f.input :phone_number
      f.input :email_address
      f.input :notes
      f.input :image, as: :file
    end
    f.actions
  end

  show do
    attributes_table do
      row :full_name
      row :phone_number
      row :email_address
      row :notes
      row :image do |customer|
        if customer.image.attached?
          image_tag url_for(customer.image), style: "max-width:200px; border-radius:8px;"
        end
      end
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end
end
# frozen_string_literal: true

ActiveAdmin.register Customer do
  permit_params :full_name, :phone_number, :email_address, :notes, :image

  index do
    selectable_column
    id_column
    column :full_name
    column :phone_number
    column :email_address
    column :notes
    if Customer.reflect_on_attachment(:image)
      column :image do |customer|
        if customer.image.attached?
          image_tag url_for(customer.image), size: "50x50"
        end
      end
    end
    actions
  end

  form do |f|
    f.inputs do
      f.input :full_name
      f.input :phone_number
      f.input :email_address
      f.input :notes
      f.input :image, as: :file
    end
    f.actions
  end
end
