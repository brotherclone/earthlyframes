json.(@user,:id, :first_name, :last_name, :email)
json.token @user.generate_jwt