# Use an official Nextcloud base image
FROM nextcloud:28.0.10

# Set environment variables for Nextcloud
ENV NEXTCLOUD_VERSION=28.0.10

# Copy your custom Nextcloud application files to the image
COPY . /var/www/html/

# Set proper permissions for Nextcloud
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Expose web server port
EXPOSE 80

# Set up entrypoint for Nextcloud
ENTRYPOINT ["/entrypoint.sh"]
CMD ["apache2-foreground"]