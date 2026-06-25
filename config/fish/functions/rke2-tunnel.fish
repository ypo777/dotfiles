function rke2-tunnel
    pkill -f "6443:localhost:6443" 2>/dev/null
    ssh -i ~/.ssh/rke2-lab.pem -o StrictHostKeyChecking=accept-new -f -N -L 6443:localhost:6443 ubuntu@3.0.51.252
    echo "tunnel up -> kubectl ready"
end
