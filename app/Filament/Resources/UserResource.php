<?php

namespace App\Filament\Resources;

use App\Filament\Resources\UserResource\Pages;
use App\Filament\Resources\UserResource\RelationManagers;
use App\Models\User;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Filament\Forms\Components\Select;
use Filament\Tables\Columns\IconColumn;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Filters\Filter;
use Filament\Tables\Filters\SelectFilter;


class UserResource extends Resource
{
  protected static ?string $model = User::class;

  protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

  public static function form(Form $form): Form
  {
    return $form
      ->schema([
        Forms\Components\TextInput::make('name')
          ->required()
          ->maxLength(255),

        Forms\Components\TextInput::make('email')
          ->email()
          ->required()
          ->maxLength(255),

        Forms\Components\TextInput::make('password')
          ->password()
          ->required()
          ->maxLength(255),

        Select::make('status')
          ->options([
            'A' => 'Active',
            'I' => 'Inactive',
          ])
          ->required()
          ->native(false)
          ->visibleOn('edit')
          ->disabled(fn($record) => $record && $record->id === 1),

      ]);
  }

  public static function table(Table $table): Table
  {
    return $table
      ->columns([
        TextColumn::make('name'),
        TextColumn::make('email'),
        IconColumn::make('status')
          ->getStateUsing(fn($record) => $record->status === 'A')
          ->boolean()
          ->trueIcon('heroicon-o-check-circle')
          ->falseIcon('heroicon-o-x-circle'),
        // ->label(fn($record) => $record->status === 'A' ? 'ACTIVE' : 'INACTIVE'), 
        TextColumn::make('updated_at')
      ])
      ->filters([
        // Filter::make('status')
        // ->query(fn (Builder $query) => $query->where('status', 'A')),
        SelectFilter::make('status')
          ->options([
            'A' => 'Active',
            'I' => 'Inactive',
          ]),
      ])
      ->actions([
        Tables\Actions\EditAction::make(),
        // Tables\Actions\ViewAction::make()->disabled(fn($record) => $record && $record->id === 1),
        Tables\Actions\DeleteAction::make()->disabled(fn($record) => $record && $record->id === 1),
      ])
      ->bulkActions([
        Tables\Actions\BulkActionGroup::make([
          Tables\Actions\DeleteBulkAction::make()
            ->disabled(fn($records) => collect($records)->contains(fn($record) => $record->id === 1)),
        ]),
      ]);
  }

  public static function getRelations(): array
  {
    return [
      //
    ];
  }

  public static function getPages(): array
  {
    return [
      'index' => Pages\ListUsers::route('/'),
      'create' => Pages\CreateUser::route('/create'),
      'edit' => Pages\EditUser::route('/{record}/edit'),
    ];
  }
}
