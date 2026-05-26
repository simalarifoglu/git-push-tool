echo "=========================================="
echo "  GIT PUSH SCRIPT"
echo "=========================================="
echo ""

if ! git rev-parse --is-inside-work-tree &>/dev/null; then
    echo "This directory is not a Git repository."
    exit 1
fi

if [[ -z $(git status -s) ]]; then
    echo "No changes to commit."
    exit 0
fi

echo "Current changes:"
git status -s
echo ""

echo "Changes summary:"
git diff --stat
echo ""

echo "Adding all changes..."
git add .
echo "All changes added"
echo ""

echo "Enter your commit message:"
read -r commit_message

if [[ -z "$commit_message" ]]; then
    echo "Commit message cannot be empty."
    exit 1
fi

echo ""
echo "Creating commit..."
git commit -m "$commit_message"

if [ $? -eq 0 ]; then
    echo "✓ Commit created successfully"
else
    echo "Commit failed"
    exit 1
fi

echo ""
echo "Pushing to remote..."
git push

if [ $? -eq 0 ]; then
    echo ""
    echo "=========================================="
    echo "  PUSH SUCCESSFUL!"
    echo "=========================================="
else
    echo ""
    echo "=========================================="
    echo "  ❌PUSH FAILED!"
    echo "=========================================="
    exit 1
fi
