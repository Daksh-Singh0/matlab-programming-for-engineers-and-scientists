function [mse,R,p,rg] = EstimationErrorPlot(prediction,target)
    mse = mean((target - prediction).^2);
    plot(target, prediction, 'r*')
    hold on;
    xlabel('True Value')
    ylabel('Model Predicted Value')
    rg = [min([prediction; target]), max([prediction; target])];
    plot(rg, rg, 'k--')
    [R, p] = corr(target, prediction);
    title(sprintf('R=%.3f; p=%.3g; MSE=%.3f', R, p, mse));
    legend('True vs Predicted', 'Diagonal');
end