function generate_image_with_rectangles(n)
    image_size = 512;

    image = zeros(image_size, image_size);

    if n <= 0
        error('Number of rectangles should be greater than 0.');
    end

    rectangle_positions = zeros(n, 4);
    rectangle_intensities = zeros(1, n);

    for i = 1:n
        width = randi([10, 200]);
        height = randi([10, 200]);
        x = randi([1, image_size - width]);
        y = randi([1, image_size - height]);
        intensity = randi([100, 255]);

        while ismember(intensity, rectangle_intensities)
            intensity = randi([100, 255]);
        end

        rectangle_positions(i, :) = [x, y, width, height];
        rectangle_intensities(i) = intensity;

        image(y:y+height, x:x+width) = intensity;
    end

    imshow(uint8(image));

    imwrite(uint8(image), 'generated_image.png');
end

% use this at octave cmd: generate_image_with_rectangles(5);

