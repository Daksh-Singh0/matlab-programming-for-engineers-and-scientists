function output = echo_gen(input, fs, delay, amp);
samples = round(fs*delay);
output = zeros(length(input) + samples, 1);
output(samples+1:end) = input*amp;
output(1:length(input)) = output(1:length(input)) + input;
max_value = max(abs(output));
if max_value > 1
    output = output / max_value;
end