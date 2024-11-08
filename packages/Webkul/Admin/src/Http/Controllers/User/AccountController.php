<?php

namespace Webkul\Admin\Http\Controllers\User;

use Hash;
use Illuminate\Support\Facades\Event;
use Illuminate\Support\Facades\Storage;
use Webkul\Admin\Http\Controllers\Controller;

class AccountController extends Controller
{
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\View\View
     */
    public function edit()
    {
        $user = auth()->guard('admin')->user();

        return view('admin::account.edit', compact('user'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @return \Illuminate\Http\Response
     */
    public function update()
    {
        $user = auth()->guard('admin')->user();

        $this->validate(request(), [
            'name'             => 'required',
            'email'            => 'email|unique:admins,email,'.$user->id,
            'password'         => 'nullable|min:6|confirmed',
            'current_password' => 'required|min:6',
            'image.*'          => 'nullable|mimes:bmp,jpeg,jpg,png,webp',
        ]);

        $data = request()->only([
            'name',
            'email',
            'password',
            'password_confirmation',
            'current_password',
            'image',
        ]);

        if (! Hash::check($data['current_password'], $user->password)) {
            session()->flash('warning', trans('admin::app.account.edit.invalid-password'));

            return redirect()->back();
        }

        $isPasswordChanged = false;

        if (! $data['password']) {
            unset($data['password']);
        } else {
            $isPasswordChanged = true;

            $data['password'] = bcrypt($data['password']);
        }

        if (request()->hasFile('image')) {
          // Guardar la imagen en el bucket S3 dentro de la carpeta 'admins/{user->id}'
          $data['image'] = request()->file('image')->store('images/'.$user->id, 's3');
      } else {
          // Si no se sube una nueva imagen
          if (!empty($user->image)) {
              // Eliminar la imagen anterior del bucket S3 si existe
              Storage::disk('s3')->delete($user->image);
          }
      
          // Si no hay nueva imagen, se mantiene la imagen actual o se deja como null
          $data['image'] = $user->image ?: null;
      }
      
      // Actualizar el usuario con la nueva imagen
      $user->update($data);
      
      

        if ($isPasswordChanged) {
            Event::dispatch('admin.password.update.after', $user);
        }

        session()->flash('success', trans('admin::app.account.edit.update-success'));

        return back();
    }
}
