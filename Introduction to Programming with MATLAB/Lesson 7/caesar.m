function coded = caesar(chars, shift)
coded = char(mod(double(chars) - double(' ') + shift, double('~') - double(' ') + 1) + double(' '));
end